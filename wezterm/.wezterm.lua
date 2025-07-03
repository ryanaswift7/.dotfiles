-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "duckbones"
config.window_close_confirmation = "NeverPrompt"
config.font = wezterm.font("FiraCode Nerd Font")
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.93
config.front_end = "WebGpu"

config.keys = {}

-- List of keys to disable with SUPER modifier
local super_keys_to_disable = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"c",
	"v",
	"n",
	"m",
	"-",
	"=",
	"0",
	"t",
	"h",
	"k",
	"f",
}

-- Add SUPER modifier key bindings to disable default assignments
for _, key in ipairs(super_keys_to_disable) do
	table.insert(config.keys, {
		key = key,
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	})
end

-- Add ALT modifier key bindings to activate tabs 0-8
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- Return the configuration
return config
