local M = {}

function M.setup(host)
	hl.on("hyprland.start", function()
		hl.exec_cmd("nm-applet")
		hl.exec_cmd("waybar & hyprsunset")
		hl.exec_cmd("hypridle -c " .. host.idle_conf)
		hl.exec_cmd("synology-drive autostart")
		for _, cmd in ipairs(host.autostart or {}) do
			hl.exec_cmd(cmd)
		end
	end)
end

return M
