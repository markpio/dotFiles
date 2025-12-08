-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.automatically_reload_config = true

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 12
config.color_scheme = 'Gruvbox Dark (Gogh)'

-- Finally, return the configuration to wezterm:
return config
