local monitor = require("modules.monitor")

local M = {}

function M.setup(hostname)
	if string.find(hostname, "Desktop") then
		local m1 = monitor.state.monitor1
		local m2 = monitor.state.monitor2

		local ws = {
			{ name = "chill1", monitor = m1, default = true },
			{ name = "chill2", monitor = m2, default = true },
			{ name = "code1", monitor = m1 },
			{ name = "code2", monitor = m2 },
			{ name = "social1", monitor = m1 },
			{ name = "social2", monitor = m2 },
			{ name = "game1", monitor = m1 },
			{ name = "game2", monitor = m2 },
			{ name = "work1", monitor = m1 },
			{ name = "work2", monitor = m2 },
			{ name = "mail1", monitor = m1 },
			{ name = "mail2", monitor = m2 },
		}

		for _, w in ipairs(ws) do
			hl.workspace_rule({
				workspace = "name:" .. w.name,
				monitor = w.monitor,
				default = w.default,
			})
		end
	end
end

return M
