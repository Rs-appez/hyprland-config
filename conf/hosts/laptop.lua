return {
	monitor1 = "eDP-1",
	monitor2 = "DP-2",
	monitors = {
		{ output = "eDP-1", mode = "1920x1080", position = "0x0", scale = 1 },
		{ output = "DP-2", mode = "1920x1080", position = "0x-1800", scale = 1 },
	},
	-- numeric workspaces on the F13-24 keys
	workspaces = {
		{ fkey = "F23", name = "browser", default = true },
		{ fkey = "F22", name = "code" },
		{ fkey = "F21", name = "social" },
		{ fkey = "F20", name = "misc" },
		{ fkey = "F19", name = "extra1" },
		{ fkey = "F24", name = "extra2" },
	},
	idle_conf = "~/.config/hypr/hypridle-laptop.conf",
	window_rules = {},
}
