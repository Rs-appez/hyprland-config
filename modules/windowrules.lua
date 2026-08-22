local M = {}

function M.setup(hostname)
	hl.window_rule({
		name = "suppress-maximize-events",
		match = { class = ".*" },
		suppress_event = "maximize",
	})

	hl.window_rule({
		name = "fix-xwayland-drags",
		match = {
			class = "^$",
			title = "^$",
			xwayland = true,
			float = true,
			fullscreen = false,
			pin = false,
		},
		no_focus = true,
	})

	hl.window_rule({
		name = "change-bordercolor-fullscreen",
		match = { fullscreen_state_client = 1 },
		border_color = "rgb(000080)",
	})

	if string.find(hostname, "Desktop") then
		hl.window_rule({
			name = "ankama-launcher",
			match = { class = "Ankama Launcher", title = "Ankama Launcher" },
			float = true,
			workspace = "name:game1",
		})

		hl.window_rule({
			name = "dofus",
			match = { class = "Dofus.x64" },
			float = true,
			workspace = "name:game1",
			suppress_event = "fullscreen",
		})

		hl.window_rule({
			name = "flameshot",
			match = { class = "(flameshot)", title = "(flameshot)" },
			move = "0 -750", -- from `move = (0) (-750)`[15]
			pin = true,
			float = true,
			monitor = 0,
		})

		hl.window_rule({
			name = "vesktop",
			match = { class = "vesktop" },
			workspace = "name:social1 silent",
		})

		hl.window_rule({
			name = "spotify",
			match = { class = "Spotify" },
			workspace = "name:social2 silent",
		})
	end
end

return M
