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
  -- Try to find the marked window
  local win = toggleWindowID and hs.window.get(toggleWindowID)

  if win then
    local front = hs.application.frontmostApplication()
    if front and front:bundleID() == WARP_BUNDLE and win == hs.window.focusedWindow() then
      win:minimize()
    else
      win:unminimize()
      win:focus()
    end
  else
    -- No marked window — fall back to whole-app toggle
    toggleWindowID = nil
    local front = hs.application.frontmostApplication()
    if front and front:bundleID() == WARP_BUNDLE then
      front:hide()
    else
      local app = hs.application.get(WARP_BUNDLE)
      if app then
        app:activate()
      else
        hs.application.open(WARP_BUNDLE)
      end
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
