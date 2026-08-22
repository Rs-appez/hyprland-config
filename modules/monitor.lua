local M = {}

-- Public state used by other modules (e.g. programs.lua for menu monitor)
M.state = {
	monitor1 = "DP-3",
	monitor2 = "HDMI-A-1",
}

function M.setup(hostname)
	if string.find(hostname, "Desktop") then
		M.state.monitor1 = "DP-3"
		M.state.monitor2 = "HDMI-A-1"

		hl.monitor({ output = M.state.monitor2, mode = "1920x1080@60", position = "0x0", scale = 1 })
		hl.monitor({ output = M.state.monitor1, mode = "3840x1600@144", position = "1920x-750", scale = 1 })
	else
		local output = "eDP-1"
		M.state.monitor1 = output
		M.state.monitor2 = output

		hl.monitor({ output = output, mode = "1920x1080", position = "0x0", scale = 1 })
	end
end

return M
