
local terminalApp = hs.appfinder.appFromName("Warp")
local textApp = hs.appfinder.appFromName("Sublime")

function toggleTerminal()
  if terminalApp then
    if terminalApp:isFrontmost() then
        terminalApp:hide()
    else
        terminalApp:activate()
        terminalApp:mainWindow():focus()
    end
  else
    hs.application.open("Warp")
    hs.reload()
  end
end

function toggleText()
  if textApp then
    if textApp:isFrontmost() then
        textApp:hide()
    else
        textApp:activate()
        textApp:mainWindow():focus()
    end
  else
    hs.application.open("Sublime")
    hs.reload()
  end
end

function bringToFront(appName)
    local app = hs.application.get(appName)
    if app then
        local mainwin = app:mainWindow()
        if mainwin then
            mainwin:application():activate(true)
            mainwin:application():unhide()
            mainwin:focus()
        end
    end
end

function reloadConfig()
    hs.reload()
    hs.alert.show("Hammerspoon config reloaded")
    
end

-- Bind keyboard shortcut to reload Hammerspoon config
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "R", reloadConfig)

-- Bind keyboard shortcut to toggle Terminal
hs.hotkey.bind({"ctrl"}, "`", toggleTerminal)
hs.hotkey.bind({"ctrl", "shift"}, "u", toggleText)

-- hs.hotkey.bind({"ctrl"}, "`", toggleTerminal)
--
-- function moveTerminalToCurrentSpace()
--     local terminalApp = hs.appfinder.appFromName(terminalAppName)
--     if terminalApp then
--         local frontmostWindow = hs.window.frontmostWindow()
--         if frontmostWindow then
--             frontmostWindow:spacesMoveToNextScreen() -- Move the window to the current space/screen
--         end
--     end
-- end

--
--
-- Function opt bring the frontmost window of the specified application to the front
-- J
-- -- -- Create a window filter for the terminal and Sublime Text
-- local terminalFilter = hs.window.filter.new("Terminal")
-- local sublimeFilter = hs.window.filter.new("Sublime Text")
-- --
-- -- -- Callback function when the terminal window loses focus
-- terminalFilter:subscribe(hs.window.filter.windowUnfocused, function()
--     bringToFront("Terminal")
-- end)
-- -- --
-- -- -- Callback function when the Sublime window loses focus
-- terminalFilter:subscribe(hs.window.filter.windowUnfocused, function()
--     bringToFront("Sublime Text")
-- end)
-- Reload Hammerspoon config
