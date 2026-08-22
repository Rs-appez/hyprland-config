local M = {}

function M.setup(hostname, programs)
	local mainMod = "SUPER"

	hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(programs.terminal))
	hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser))
	hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(programs.browser .. " --private-window"))
	hl.bind(mainMod .. " + Q", hl.dsp.window.close())
	hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("emote"))
	hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
	hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.menu))
	hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
	hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))
	hl.bind(mainMod .. " + I", hl.dsp.layout("swapsplit"))
	hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("loginctl lock-session"))
	hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("dunstctl close-all"))
	hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("hyprpicker -a"))

	hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
	hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
	hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
	hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

	hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
	hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
	hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
	hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

	hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

	local azerty_keys = {
		"ampersand",
		"eacute",
		"quotedbl",
		"apostrophe",
		"parenleft",
		"minus",
		"egrave",
		"underscore",
		"ccedilla",
		"agrave",
	}

	for i, key in ipairs(azerty_keys) do
		hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	end

	if string.find(hostname, "Desktop") then
		hl.bind("F23", hl.dsp.focus({ workspace = "name:chill1" }))
		hl.bind("F22", hl.dsp.focus({ workspace = "name:code1" }))
		hl.bind("F21", hl.dsp.focus({ workspace = "name:social1" }))
		hl.bind("F20", hl.dsp.focus({ workspace = "name:game1" }))
		hl.bind("F19", hl.dsp.focus({ workspace = "name:work1" }))
		hl.bind("F24", hl.dsp.focus({ workspace = "name:mail1" }))

		hl.bind("CTRL + F23", hl.dsp.window.move({ workspace = "name:chill1" }))
		hl.bind("CTRL + F22", hl.dsp.window.move({ workspace = "name:code1" }))
		hl.bind("CTRL + F21", hl.dsp.window.move({ workspace = "name:social1" }))
		hl.bind("CTRL + F20", hl.dsp.window.move({ workspace = "name:game1" }))
		hl.bind("CTRL + F19", hl.dsp.window.move({ workspace = "name:work1" }))
		hl.bind("CTRL + F24", hl.dsp.window.move({ workspace = "name:mail1" }))
	else
		hl.bind("F23", hl.dsp.focus({ workspace = 1 }))
		hl.bind("F22", hl.dsp.focus({ workspace = 2 }))
		hl.bind("F21", hl.dsp.focus({ workspace = 3 }))
		hl.bind("F20", hl.dsp.focus({ workspace = 4 }))
		hl.bind("F19", hl.dsp.focus({ workspace = 5 }))
		hl.bind("F24", hl.dsp.focus({ workspace = 6 }))

		hl.bind("CTRL + F23", hl.dsp.window.move({ workspace = 1 }))
		hl.bind("CTRL + F22", hl.dsp.window.move({ workspace = 2 }))
		hl.bind("CTRL + F21", hl.dsp.window.move({ workspace = 3 }))
		hl.bind("CTRL + F20", hl.dsp.window.move({ workspace = 4 }))
		hl.bind("CTRL + F19", hl.dsp.window.move({ workspace = 5 }))
		hl.bind("CTRL + F24", hl.dsp.window.move({ workspace = 6 }))
	end

	hl.bind(
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMicMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
	hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

	hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
	hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

	hl.bind("Print", hl.dsp.exec_cmd("hyprctl dispatch exec flameshot gui"))
end

return M
