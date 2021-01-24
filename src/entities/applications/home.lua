----------------------------------------------------------------------------------------------------
-- Home application config
--
local Ki = spoon.Ki
local Application = Ki.Application
local ChooseMenuItemAndFocus = Application.ChooseMenuItemAndFocus
local SelectMenuItemAndFocus = Application.SelectMenuItemAndFocus
local ToggleMenuItemAndFocus = Application.ToggleMenuItemAndFocus
local unmapped = Application.unmapped

return Application {
    name = "Home",
    shortcuts = {
        Home = {
            { nil, "h", SelectMenuItemAndFocus { "Home", "Hide Home" } },
            { nil, "q", SelectMenuItemAndFocus { "Home", "Quit Home" } },
            { { "alt" }, "h", SelectMenuItemAndFocus { "Home", "Hide Others" } },
            { { "alt" }, "q", SelectMenuItemAndFocus { "Home", "Quit and Keep Windows" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Home", "About Home" } },
            { unmapped, unmapped, ChooseMenuItemAndFocus { "Home", "Services" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Home", "Show All" } },
        },
        File = {
            { nil, "w", SelectMenuItemAndFocus { "File", "Close" } },
            { { "alt" }, "w", SelectMenuItemAndFocus { "File", "Close All" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "File", "Add Automation…" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "File", "Add Scene…" } },
        },
        Edit = {
            { nil, "a", SelectMenuItemAndFocus { "Edit", "Select All" } },
            { nil, "c", SelectMenuItemAndFocus { "Edit", "Copy" } },
            { nil, "f", SelectMenuItemAndFocus { "Edit", "Find…" } },
            { nil, "v", SelectMenuItemAndFocus { "Edit", "Paste" } },
            { nil, "x", SelectMenuItemAndFocus { "Edit", "Cut" } },
            { nil, "z", SelectMenuItemAndFocus { "Edit", "Undo" } },
            { { "shift" }, "h", SelectMenuItemAndFocus { "Edit", "Edit Home…" } },
            { { "shift" }, "r", SelectMenuItemAndFocus { "Edit", "Edit Room…" } },
            { { "shift" }, "z", SelectMenuItemAndFocus { "Edit", "Redo" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Edit", "Delete" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Edit", "Emoji & Symbols" } },
            { unmapped, unmapped, ChooseMenuItemAndFocus { "Edit", "Speech" } },
            { unmapped, unmapped, ChooseMenuItemAndFocus { "Edit", "Spelling and Grammar" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Edit", "Start Dictation" } },
            { unmapped, unmapped, ChooseMenuItemAndFocus { "Edit", "Substitutions" } },
            { unmapped, unmapped, ChooseMenuItemAndFocus { "Edit", "Transformations" } },
        },
        View = {
            { nil, "1", SelectMenuItemAndFocus { "View", "Home" } },
            { nil, "2", SelectMenuItemAndFocus { "View", "Rooms" } },
            { nil, "3", SelectMenuItemAndFocus { "View", "Automation" } },
            { { "ctrl" }, "f", ToggleMenuItemAndFocus { "Enter Full Screen", "Exit Full Screen" } },
        },
        Window = {
            { nil, "m", SelectMenuItemAndFocus { "Window", "Minimize" } },
            { { "alt" }, "m", SelectMenuItemAndFocus { "Window", "Minimize All" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Window", "Arrange in Front" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Window", "Bring All to Front" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Window", "Home" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Window", "Move Window to Left Side of Screen" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Window", "Move Window to Right Side of Screen" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Window", "Zoom All" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Window", "Zoom" } },
        },
        Help = {
            { unmapped, unmapped, SelectMenuItemAndFocus { "Help", "About Home…" } },
            { unmapped, unmapped, SelectMenuItemAndFocus { "Help", "Home Help" } },
        },
    },
}
