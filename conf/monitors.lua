local M = {}

function M.setup(host)
	for _, mon in ipairs(host.monitors) do
		hl.monitor(mon)
	end
	for _, ws in ipairs(host.workspaces) do
		if ws.name then
			local r1 = { workspace = "name:" .. ws.name .. "1", monitor = host.monitor1 }
			local r2 = { workspace = "name:" .. ws.name .. "2", monitor = host.monitor2 }
			if ws.default then
				r1.default = true
				r2.default = true
			end
			hl.workspace_rule(r1)
			hl.workspace_rule(r2)
		end
	end
end

return M
