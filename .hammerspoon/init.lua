hs.window.animationDuration = 0

local WARP_BUNDLE = "dev.warp.Warp-Stable"
local TOGGLE_TAB = "TERM"
local toggleWindowID = nil

-- Scan Warp windows for one with the toggle tab name
function scanForToggleWindow()
  local app = hs.application.get(WARP_BUNDLE)
  if not app then return end
  for _, win in ipairs(app:allWindows()) do
    if string.find(win:title(), TOGGLE_TAB) then
      toggleWindowID = win:id()
      return
    end
  end
end

-- Watch for Warp windows with toggle tab name and remember them
local warpFilter = hs.window.filter.new(false):setAppFilter("Warp")
warpFilter:subscribe(hs.window.filter.windowTitleChanged, function(win)
  if win and string.find(win:title(), TOGGLE_TAB) then
    toggleWindowID = win:id()
  end
end)
warpFilter:subscribe(hs.window.filter.windowFocused, function(win)
  if win and string.find(win:title(), TOGGLE_TAB) then
    toggleWindowID = win:id()
  end
end)

-- Scan on startup (delayed to let Warp finish launching)
hs.timer.doAfter(2, scanForToggleWindow)

function toggleTerminal()
  local app = hs.application.get(WARP_BUNDLE)
  if not app then
    hs.application.open(WARP_BUNDLE)
    return
  end

  -- Fast path: search only Warp's windows instead of all system windows
  local win = nil
  if toggleWindowID then
    for _, w in ipairs(app:allWindows()) do
      if w:id() == toggleWindowID then
        win = w
        break
      end
    end
  end

  if win then
    local focused = hs.window.focusedWindow()
    if focused and win:id() == focused:id() then
      win:minimize()
    else
      win:raise()
    end
  else
    toggleWindowID = nil
    if app:isFrontmost() then
      app:hide()
    else
      app:activate()
    end
  end
end

function toggleText()
  local front = hs.application.frontmostApplication()
  if front and front:name() == "Sublime Text" then
    front:hide()
  else
    local app = hs.application.get("Sublime Text")
    if app then
      app:activate()
    else
      hs.application.open("Sublime Text")
    end
  end
end

function reloadConfig()
  hs.reload()
  hs.alert.show("Hammerspoon config reloaded")
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "R", reloadConfig)
hs.hotkey.bind({"ctrl"}, "`", toggleTerminal)
hs.hotkey.bind({"ctrl", "shift"}, "u", toggleText)
