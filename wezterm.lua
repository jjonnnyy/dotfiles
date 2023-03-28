-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.color_scheme = 'Alabaster'
-- config.color_scheme = 'N0tch2k'
config.color_scheme = 'nightfox'

config.keys = {
  {
    key = '\'',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '5',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '.',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  }
}

config.window_frame = {
  -- The size of the font in the tab bar.
  -- Default to 10. on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  -- work '#147D64'
  -- personal '#4C63B6'
  active_titlebar_bg = '#4C63B6',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#4C63B6',
}

-- and finally, return the configuration to wezterm
return config
