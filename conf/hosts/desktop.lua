return {
	monitor1 = "DP-3",
	monitor2 = "HDMI-A-1",
	monitors = {
		{ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = 1 },
		{ output = "DP-3", mode = "3840x1600@144", position = "1920x-750", scale = 1 },
	},
	-- paired named workspaces: <name>1 lands on monitor1, <name>2 on monitor2
	workspaces = {
		{ fkey = "F23", name = "chill", default = true },
		{ fkey = "F22", name = "code" },
		{ fkey = "F21", name = "social" },
		{ fkey = "F20", name = "game" },
		{ fkey = "F19", name = "work" },
		{ fkey = "F24", name = "mail" },
	},
	autostart = {
		"vesktop",
		"vesktop --user-data-dir=$HOME/.config/vesktop-work",
		"spotify",
		"keepassxc %U",
	},
	idle_conf = "~/.config/hypr/hypridle-desktop.conf",
	window_rules = {
		{
			name = "ankama-launcher",
			match = { class = "Ankama Launcher", title = "Ankama Launcher" },
			float = true,
			workspace = "name:game1",
		},
		{
			name = "dofus",
			match = { class = "Dofus.x64" },
			float = true,
			workspace = "name:game1",
			suppress_event = "fullscreen",
		},
		{
			name = "flameshot",
			match = { class = "(flameshot)", title = "(flameshot)" },
			move = "0 -750",
			pin = true,
			float = true,
			monitor = 0,
		},
		{ name = "vesktop", match = { class = "vesktop" }, workspace = "name:social1 silent" },
		{ name = "spotify", match = { class = "Spotify" }, workspace = "name:social2 silent" },
	},
}
