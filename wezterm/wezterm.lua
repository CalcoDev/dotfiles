-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', "-i", "-l" }
config.default_cwd = "C:\\Users\\calco\\Documents\\Calcopod"

-- config.color_scheme = 'Gruvbox Material (Gogh)'
-- config.color_scheme = 'matrix'
-- config.color_scheme = 'Matrix (terminal.sexy)'

-- config.color_scheme = 'Mono Theme (terminal.sexy)'
-- config.color_scheme = 'Sequoia Monochrome'

-- config.color_scheme = 'Erebus (terminal.sexy)'

-- config.color_scheme = 'Greenscreen (dark) (terminal.sexy)'
-- config.color_scheme = 'HaX0R_GR33N'

-- config.color_scheme = 'Nature Suede (terminal.sexy)' -- cool but no fit sadly
-- config.color_scheme = 'Teva (terminal.sexy)'

-- config.color_scheme = 'Sea Shells (Gogh)' -- good but diff

-- config.color_scheme = 'Tomorrow Night Burns' -- REALLY GOOD RED
-- config.color_scheme = 'Unsifted Wheat (terminal.sexy)' -- REALLY GOOD WHEAT
-- config.color_scheme = 'VisiBlue (terminal.sexy)' -- REALLY GOOD BLUE

-- config.color_scheme = 'Mono Cyan (Gogh)'
-- config.color_scheme = 'Tomorrow Night Blue (Gogh)'
config.color_scheme = 'Killua TTheme'
-- config.color_scheme = 'Killua Theme Blue'

-- config.color_scheme = 'Batman' -- decent ish not sure
-- config.color_scheme = 'Count Von Count (terminal.sexy)'

-- config.color_scheme = 'Tomorrow Night Burns' -- REALLY GOOD RED
-- config.color_scheme = 'Tomorrow Night Burns Calcopod' -- REALLY GOOD RED
-- config.color_scheme = 'Unsifted Wheat (terminal.sexy)' -- (works with darkrose / lackluster)
-- config.color_scheme = 'darkrose' -- REALLY GOOD RED -- (eyes hurt)

-- config.font = wezterm.font 'Consolas'
-- config.font = wezterm.font 'Cascadia Code'
config.font = wezterm.font 'Fira Mono'

-- config.font = wezterm.font 'Ubuntu Mono'

-- config.font = wezterm.font 'Comic Mono'
-- config.font = wezterm.font 'Iosevka'

-- config.font = wezterm.font 'SF Mono'

-- config.font = wezterm.font 'Fantasque Sans Mono'
-- config.font = wezterm.font 'JetBrains Mono'

-- config.font = wezterm.font 'Pragmasevka'
-- config.font = wezterm.font 'Monaspace Neon'
-- config.font = wezterm.font 'Monaspace Argon'
-- config.font = wezterm.font 'Monaspace Xenon'
-- config.font = wezterm.font 'Monaspace Radon'
-- config.font = wezterm.font 'Monaspace Krypton'

-- config.font = wezterm.font 'Operator Mono Book'

-- config.font = wezterm.font 'Mononoki'
-- config.font = wezterm.font 'PragmataPro'

config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

config.window_padding = {
    left = '1cell',
    right = '1cell',
    top = '0',
    bottom = '0',
}

config.background = {
    {
        source = {
            File = 'rose-colour.jpg'
            -- File = 'timo.gif'
            -- File = 'photos/gojo-purple.jpg'
            -- File = 'photos/gojo-purple-proc-blur-10.jpg'


            -- File = 'photos/gojo-wins.jpg'
            -- File = 'photos/gojo-domain.jpg'
            -- File = 'photos/gojo-suku-clash-3.jpg'
            -- File = 'photos/gojo-suku-clash-3-blur-10.jpg'
            -- File = 'photos/killua-front-right-proc.jpg'

            -- File = 'photos/celeste.jpg'
            -- File = 'photos/killua-front.jpg'
            -- File = 'photos/killua-front-right-proc.jpg'
            -- File = 'photos/killua-front-right-proc-blur-5.jpg'
            -- File = 'photos/killua-front-right-proc.jpg'
            -- File = 'photos/killua-outline.png'
        },
        hsb = {
            brightness = 0.02,
            -- saturation = 0.7
        },
        vertical_align = "Middle",
        horizontal_align = "Center",
        -- height = "Cover",
        -- width = "Cover",
    }
}

config.colors = {
    tab_bar = {
        background = 'rgba(0,0,0,0)',

        active_tab = {
            bg_color = 'rgba(0,0,0,0)',
            fg_color = '#fff',

            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            intensity = 'Bold',
            -- Specify whether you want "None", "Single" or "Double" underline for
            underline = 'None',
            -- Specify whether you want the text to be italic (true) or not (false)
            italic = false,
        },

        inactive_tab = {
            bg_color = 'rgba(0,0,0,0)',
            fg_color = '#fff',

            intensity = 'Normal',
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
            bg_color = 'rgba(0,0,0,0)',
            fg_color = '#fff',
            intensity = 'Half',
            italic = false,
        },

        -- The new tab button that let you create new tabs
        new_tab = {
            bg_color = 'rgba(0,0,0,0)',
            fg_color = '#fff',
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
            bg_color = 'rgba(0,0,0,0)',
            fg_color = '#fff',
            italic = true,
        },
    },
}


config.window_close_confirmation = 'NeverPrompt'

config.adjust_window_size_when_changing_font_size = false

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.inactive_pane_hsb = {
    saturation = .75,
    brightness = 0.1
}

config.debug_key_events = true

config.leader = { key = 'b', mods = "CTRL", timeout_milliseconds = 1000 }

local function create_resize_binding(key, resize)
    table.insert(config.key_tables.resize_pane,
        { key = key, mods = "CTRL|ALT", action = wezterm.action { AdjustPaneSize = { resize, 1 } } })
    return {
        key = key,
        mods = 'CTRL|ALT',
        action = wezterm.action.Multiple {
            wezterm.action { AdjustPaneSize = { resize, 1 } },
            wezterm.action.ActivateKeyTable {
                name = 'resize_pane',
                one_shot = false,
                timeout_milliseconds = 1000
            },
        }
    }
end

config.key_tables = {
    resize_pane = {
        -- Cancel mode by pressing escape
        { key = 'Escape', action = 'PopKeyTable' },
    }
}

config.keys = {
    { key = "a",  mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x01" } },

    { key = "\"", mods = "LEADER|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "%",  mods = "LEADER|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },

    { key = "o",  mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "o",  mods = "LEADER|CTRL",  action = "TogglePaneZoomState" },

    { key = "c",  mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },

    -- { key = "c",          mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    -- { key = "LeftArrow",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
    -- { key = "LeftArrow",  mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Left" } },
    -- { key = "DownArrow",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
    -- { key = "DownArrow",  mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Down" } },
    -- { key = "UpArrow",    mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
    -- { key = "UpArrow",    mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Up" } },
    -- { key = "RightArrow", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
    -- { key = "RightArrow", mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "h",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "h",  mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j",  mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k",  mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l",  mods = "LEADER|CTRL",  action = wezterm.action { ActivatePaneDirection = "Right" } },

    -- NOTE(calco): Annoying fix to make this work exactly like tmux lmfao
    create_resize_binding('h', 'Left'),
    create_resize_binding('j', 'Down'),
    create_resize_binding('k', 'Up'),
    create_resize_binding('l', 'Right'),

    { key = "1",   mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
    { key = "2",   mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
    { key = "3",   mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
    { key = "4",   mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
    { key = "5",   mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
    { key = "6",   mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
    { key = "7",   mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
    { key = "8",   mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
    { key = "9",   mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },

    { key = 'p',   mods = 'LEADER',       action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'p',   mods = 'LEADER|CTRL',  action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'n',   mods = 'LEADER',       action = wezterm.action.ActivateTabRelative(1) },
    { key = 'n',   mods = 'LEADER|CTRL',  action = wezterm.action.ActivateTabRelative(1) },

    { key = "&",   mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = false } } },
    { key = "d",   mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = false } } },
    { key = "x",   mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = false } } },

    { key = 'F11', mods = '',             action = wezterm.action.ToggleFullScreen, },
}

-- and finally, return the configuration to wezterm
return config -- Pull in the wezterm API
