----------------------------------------------------------------------------------------------------
-- Default config
--
-- Configuration of default macOS entities and their shortcuts
--
-- luacov: disable
local Ki = spoon.Ki
local File = Ki.File
local Mode = Ki.Mode
local ModeTransition = Ki.ModeTransition
local ModeTransitions = Ki.ModeTransitions
local spoonPath = hs.spoons.scriptPath()

-- Add entities directory to package path and add helper require function
package.path = package.path..";"..spoonPath.."entities/?.lua"
local function requireEntity(type, filename)
    local directory = type == "entity" and "entities" or type.."s"
    return require(directory.."."..filename)
end

-- Initialize entities
local entities = {
    ActivityMonitor = requireEntity("application", "activity-monitor"),
    AppStore = requireEntity("application", "app-store"),
    Books = requireEntity("application", "books"),
    Calculator = requireEntity("application", "calculator"),
    Calendar = requireEntity("application", "calendar"),
    Contacts = requireEntity("application", "contacts"),
    Dictionary = requireEntity("application", "dictionary"),
    DiskUtility = requireEntity("application", "disk-utility"),
    FaceTime = requireEntity("application", "facetime"),
    FindMy = requireEntity("application", "find-my"),
    Finder = requireEntity("application", "finder"),
    GoogleChrome = requireEntity("application", "google-chrome"),
    Home = requireEntity("application", "home"),
    Mail = requireEntity("application", "mail"),
    Maps = requireEntity("application", "maps"),
    Messages = requireEntity("application", "messages"),
    Music = requireEntity("application", "music"),
    News = requireEntity("application", "news"),
    Notes = requireEntity("application", "notes"),
    PhotoBooth = requireEntity("application", "photo-booth"),
    Photos = requireEntity("application", "photos"),
    Preview = requireEntity("application", "preview"),
    QuickTimePlayer = requireEntity("application", "quicktime-player"),
    Reminders = requireEntity("application", "reminders"),
    Safari = requireEntity("application", "safari"),
    Siri = requireEntity("application", "siri"),
    Spotify = requireEntity("application", "spotify"),
    Stickies = requireEntity("application", "stickies"),
    System = requireEntity("entity", "system"),
    SystemPreferences = requireEntity("application", "system-preferences"),
    Terminal = requireEntity("application", "terminal"),
    TextEdit = requireEntity("application", "text-edit"),
    VoiceMemos = requireEntity("application", "voice-memos"),
}

-- Register entity mode shortcuts
Mode {
    name = "entity",
    shortcut = { {"cmd"}, "e" },
    shortcuts = {
        { nil, "a", entities.AppStore },
        { nil, "b", entities.Books },
        { nil, "c", entities.Calendar },
        { nil, "d", entities.Dictionary },
        { nil, "f", entities.Finder },
        { nil, "g", entities.GoogleChrome },
        { nil, "h", entities.Home },
        { nil, "m", entities.Messages },
        { nil, "n", entities.Notes },
        { nil, "p", entities.Preview },
        { nil, "q", entities.QuickTimePlayer },
        { nil, "r", entities.Reminders },
        { nil, "s", entities.Safari },
        { nil, "t", entities.Terminal },
        { nil, "v", entities.VoiceMemos },
        { nil, ",", entities.SystemPreferences },
        { { "cmd" }, "d", entities.DiskUtility },
        { { "alt", "cmd" }, "m", entities.Music },
        { { "alt", "cmd" }, "s", entities.Siri },
        { { "ctrl", "cmd" }, "s", entities.System },
        { { "shift" }, "a", entities.ActivityMonitor },
        { { "shift" }, "c", entities.Calculator },
        { { "shift" }, "f", entities.FaceTime },
        { { "shift" }, "m", entities.Maps },
        { { "shift" }, "n", entities.News },
        { { "shift" }, "p", entities.PhotoBooth },
        { { "shift" }, "s", entities.Spotify },
        { { "shift" }, "t", entities.TextEdit },
        { { "shift", "cmd" }, "c", entities.Contacts },
        { { "shift", "cmd" }, "f", entities.FindMy },
        { { "shift", "cmd" }, "p", entities.Photos },
        { { "shift", "cmd" }, "m", entities.Mail },
        { { "shift", "cmd" }, "s", entities.Stickies },
    },
}

-- Register select mode and assign shortcuts for applicable entities that implement selection
Mode {
    name = "select",
    shortcut = { { "cmd" }, "s" },
    shortcuts = {
        { nil, "d", entities.Dictionary, "Select a Dictionary window" },
        { nil, "f", entities.Finder, "Select a Finder window" },
        { nil, "g", entities.GoogleChrome, "Select a Google Chrome tab or window" },
        { nil, "m", entities.Messages, "Select a Messages conversation" },
        { nil, "n", entities.Notes, "Select a Note" },
        { nil, "p", entities.Preview, "Select a Preview window" },
        { nil, "q", entities.QuickTimePlayer, "QuickTime Player" },
        { nil, "s", entities.Safari, "Select a Safari tab or window" },
        { nil, "t", entities.Terminal, "Select a Terminal window" },
        { nil, ",", entities.SystemPreferences, "Select a System Preferences pane" },
        { { "shift" }, "t", entities.TextEdit, "Select a Text Edit window" },
    },
}

-- Initialize file entities
local function FinderApplication(name)
    return function()
        return hs.application.launchOrFocus(name)
    end
end
local files = {
    Applications = File "/Applications",
    Desktop = File "~/Desktop",
    Documents = File "~/Documents",
    Downloads = File "~/Downloads",
    Home = File "~",
    Library = File "~/Library",
    Movies = File "~/Movies",
    Pictures = File "~/Pictures",
    System = File "/System",
    Trash = File "~/.Trash",
    Users = File "/Users",
    Volumes = File "/Volumes",
    Airdrop = FinderApplication("Airdrop"),
    AllMyFiles = FinderApplication("All My Files"),
    Computer = FinderApplication("Computer"),
    iCloudDrive = FinderApplication("iCloud Drive"),
    Network = FinderApplication("Network"),
    Recents = FinderApplication("Recents"),
}
-- Register file mode and assign shortcuts for the initialized file entities
Mode {
    name = "file",
    shortcut = { {"cmd"}, "f" },
    shortcuts = {
        { nil, "a", files.Applications },
        { nil, "d", files.Downloads },
        { nil, "h", files.Home },
        { nil, "l", files.Library },
        { nil, "m", files.Movies },
        { nil, "p", files.Pictures },
        { nil, "s", files.System },
        { nil, "t", files.Trash },
        { nil, "u", files.Users },
        { nil, "v", files.Volumes },
        { { "cmd" }, "a", files.Airdrop, "Airdrop" },
        { { "cmd" }, "c", files.Computer, "Computer" },
        { { "cmd" }, "i", files.iCloudDrive, "iCloud Drive" },
        { { "cmd" }, "n", files.Network, "Network" },
        { { "cmd" }, "r", files.Recents, "Recents" },
        { { "shift" }, "a", files.AllMyFiles, "All My Files" },
        { { "shift" }, "d", files.Desktop },
        { { "cmd", "shift" }, "d", files.Documents },
    },
}

-- Initialize website entities
local websites = {
    Amazon = requireEntity("website", "amazon"),
    Facebook = requireEntity("website", "facebook"),
    GitHub = requireEntity("website", "github"),
    GMail = requireEntity("website", "gmail"),
    Google = requireEntity("website", "google"),
    GoogleMaps = requireEntity("website", "google-maps"),
    HackerNews = requireEntity("website", "hacker-news"),
    LinkedIn = requireEntity("website", "linkedin"),
    Messenger = requireEntity("website", "messenger"),
    Netflix = requireEntity("website", "netflix"),
    Reddit = requireEntity("website", "reddit"),
    Twitter = requireEntity("website", "twitter"),
    Wikipedia = requireEntity("website", "wikipedia"),
    Weather = requireEntity("website", "weather"),
    Yelp = requireEntity("website", "yelp"),
    YouTube = requireEntity("website", "youtube"),
    Zillow = requireEntity("website", "zillow"),
}
-- Register Website mode and assign shortcuts for the initialized website entities
Mode {
    name = "website",
    shortcut = { {"cmd"}, "w" },
    shortcuts = {
        { nil, "a", websites.Amazon },
        { nil, "f", websites.Facebook },
        { nil, "g", websites.Google },
        { nil, "h", websites.HackerNews },
        { nil, "l", websites.LinkedIn },
        { nil, "m", websites.Messenger },
        { nil, "n", websites.Netflix },
        { nil, "r", websites.Reddit },
        { nil, "t", websites.Twitter },
        { nil, "w", websites.Wikipedia },
        { nil, "y", websites.YouTube },
        { nil, "z", websites.Zillow },
        { { "shift" }, "g", websites.GitHub },
        { { "shift" }, "m", websites.GoogleMaps },
        { { "shift" }, "w", websites.Weather },
        { { "shift" }, "y", websites.Yelp },
        { { "cmd", "shift" }, "m", websites.GMail },
    },
}

-- Register volume mode and assign shortcuts
local Volume = requireEntity("entity", "volume")
Mode {
    name = "volume",
    shortcut = { {"cmd"}, "v" },
    shortcuts = Volume.shortcuts,
}

-- Register brightness mode and assign shortcuts
local Brightness = requireEntity("entity", "brightness")
Mode {
    name = "brightness",
    shortcut = { {"cmd"}, "b" },
    shortcuts = Brightness.shortcuts,
}

ModeTransitions {
    -- Register mode transitions between select mode and others
    { "entity", "select", { { "cmd" }, "s" } },
    { "select", "entity", { { "cmd" }, "e" } },
    { "select", "file", { { "cmd" }, "f" } },
    { "select", "website", { { "cmd" }, "w" } },

    -- Register mode transitions to allow transitioning from entity to file mode
    { "entity", "file", { {"cmd"}, "f" } },

    -- Register mode transitions to allow transitioning from entity to website mode
    { "entity", "website", { {"cmd"}, "w" } },
}


-- Register mode transitions between select mode and others
ModeTransition { "entity", "select", { { "cmd" }, "s" } }
ModeTransition { "select", "entity", { { "cmd" }, "e" } }
ModeTransition { "select", "file", { { "cmd" }, "f" } }
ModeTransition { "select", "website", { { "cmd" }, "w" } }

-- Register mode transitions to allow transitioning from entity to file mode
ModeTransition { "entity", "file", { {"cmd"}, "f" } }

-- Register mode transitions to allow transitioning from entity to website mode
ModeTransition { "entity", "website", { {"cmd"}, "w" } }

-- Set default entities
Ki.defaultEntities = {
    volume = Volume,
    brightness = Brightness,
    entity = entities,
    file = files,
    website = websites,
}
