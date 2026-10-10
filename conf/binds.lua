local M = {}

local mainMod = "SUPER"
local azerty = {
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

-- your old config bound the same F-key twice (ws2 then ws1) so both monitors switch
-- together; hyprlang allowed that, Lua needs one bind that dispatches both.
local function focus_pair(ws1, ws2)
	return function()
		hl.dispatch(hl.dsp.focus({ workspace = ws2 }))
		hl.dispatch(hl.dsp.focus({ workspace = ws1 }))
	end
end

function M.setup(host)
	local terminal = "ghostty"
	local browser = "librewolf"
	local menu = "wofi --show drun --monitor " .. host.monitor1
	hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
	hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
	hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(browser .. " --private-window"))
	hl.bind(mainMod .. " + Q", hl.dsp.window.close())
	-- hl.bind(mainMod .. " + M", hl.dsp.exit())
	hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("emote"))
	hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
	hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
	hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
	hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))
	hl.bind(mainMod .. " + I", hl.dsp.layout("swapsplit"))
	hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("loginctl lock-session"))
	hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("dunstctl close-all"))
	hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("hyprpicker -a"))
	hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
	hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
	hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
	hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
	hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
	hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
	hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
	hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
	hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
	hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- SUPER + azerty row -> numeric workspaces 1..10 (all hosts)
	for i, key in ipairs(azerty) do
		hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	end -- F13-24 row -> per-host workspaces
	for _, ws in ipairs(host.workspaces) do
		if ws.name then
			local ws1 = "name:" .. ws.name .. "1"
			local ws2 = "name:" .. ws.name .. "2"
			hl.bind(ws.fkey, focus_pair(ws1, ws2))
			hl.bind("CTRL + " .. ws.fkey, hl.dsp.window.move({ workspace = ws1 }))
		else
			hl.bind(ws.fkey, hl.dsp.focus({ workspace = ws.id }))
			hl.bind("CTRL + " .. ws.fkey, hl.dsp.window.move({ workspace = ws.id }))
		end
	end -- monitor hopping, only meaningful with two outputs
	if host.monitor1 ~= host.monitor2 then
		hl.bind(mainMod .. " + CTRL + K", hl.dsp.focus({ monitor = host.monitor2 }))
		hl.bind(mainMod .. " + CTRL + J", hl.dsp.focus({ monitor = host.monitor1 }))
		hl.bind(mainMod .. " + CTRL + SHIFT + K", hl.dsp.window.move({ monitor = host.monitor2, follow = true }))
		hl.bind(mainMod .. " + CTRL + SHIFT + J", hl.dsp.window.move({ monitor = host.monitor1, follow = true }))
	end -- media / brightness
	local lr = { locked = true, repeating = true }
	hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), lr)
	hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), lr)
	hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), lr)
	hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), lr)
	hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), lr)
	hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), lr)
	hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
	hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
end

return M
