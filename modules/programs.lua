local monitor = require("modules.monitor")

local M = {}

M.state = {
	terminal = "ghostty",
	fileManager = "dolphin",
	browser = "librewolf",
	menu = nil,
}

function M.setup()
	local monitor1 = monitor.state.monitor1
	M.state.menu = "wofi --show drun --monitor " .. monitor1
end

return M
