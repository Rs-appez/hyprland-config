local M = {}

function M.setup(host)
	hl.window_rule({
		name = "suppress-maximize-events",
		match = { class = ".*" },
		suppress_event = "maximize",
	})
	hl.window_rule({
		name = "fix-xwayland-drags",
		match = { class = "^", title = "^", xwayland = true, float = true, fullscreen = false, pin = false },
		no_focus = true,
	})
	hl.window_rule({
		name = "change-bordercolor-fullscreen",
		match = { fullscreen_state_client = 1 },
		border_color = "rgb(000080)",
	})
	for _, rule in ipairs(host.window_rules or {}) do
		hl.window_rule(rule)
	end
end

return M
