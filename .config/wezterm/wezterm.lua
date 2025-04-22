local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.colors = {
    background = 'black'
}
config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.font_size = 20
config.window_decorations = "RESIZE"

return config
