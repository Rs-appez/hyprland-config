return {
	monitor1 = "eDP-1",
	monitor2 = "eDP-1",
	monitors = {
		{ output = "eDP-1", mode = "1920x1080", position = "0x0", scale = 1 },
	},
	-- numeric workspaces on the F13-24 keys
	workspaces = {
		{ fkey = "F23", id = 1 },
		{ fkey = "F22", id = 2 },
		{ fkey = "F21", id = 3 },
		{ fkey = "F20", id = 4 },
		{ fkey = "F19", id = 5 },
		{ fkey = "F24", id = 6 },
	},
	idle_conf = "~/.config/hypr/hypridle-laptop.conf",
	window_rules = {},
}
