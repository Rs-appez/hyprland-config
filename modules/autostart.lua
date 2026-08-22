local M = {}

function M.setup(hostname)
	hl.on("hyprland.start", function()
		hl.exec_cmd("nm-applet")
		hl.exec_cmd("waybar & hyprsunset")
		hl.exec_cmd("hypridle")
		hl.exec_cmd("synology-drive autostart")
	end)

	if string.find(hostname, "Desktop") then
		hl.on("hyprland.start", function()
			hl.exec_cmd("vesktop")
			hl.exec_cmd("spotify")
			hl.exec_cmd("keepassxc %U")
		end)
	elseif hostname == "Laptop" then
		hl.on("hyprland.start", function()
			hl.exec_cmd("org.keepassxc.KeePassXC")
		end)
	end
end

return M
