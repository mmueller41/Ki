local spoonPath = debug.getinfo(3, "S").source:sub(2):match("(.*/)"):sub(1, -2)
local Application = dofile(spoonPath.."/application.lua")
local actions = {
    previousSong = Application.createMenuItemEvent("Previous", { focusAfter = true }),
    nextSong = Application.createMenuItemEvent("Next", { focusAfter = true }),
    stop = Application.createMenuItemEvent("Stop", { focusAfter = true }),
    goToCurrentSong = Application.createMenuItemEvent("Go to Current Song", { focusAfter = true }),
}

function actions.togglePlay(app)
    _ = app:selectMenuItem("Play") or app:selectMenuItem("Pause")
end

local shortcuts = {
    { nil, "space", actions.togglePlay, { "Controls", "Play" } },
    { nil, "p", actions.previousSong, { "Controls", "Previous" } },
    { nil, "n", actions.nextSong, { "Controls", "Next" } },
    { nil, "s", actions.stop, { "Controls", "Stop" } },
    { nil, "l", actions.goToCurrentSong, { "Controls", "Go to Current Song" } },
}

return Application:new("iTunes", shortcuts), shortcuts, actions