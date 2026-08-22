local M = {}

function M.setup()
	hl.config({
		input = {
			kb_layout = "fr",
			kb_variant = "",
			kb_model = "",
			kb_options = "fkeys:basic_13-24",
			kb_rules = "",
			follow_mouse = 1,
			numlock_by_default = true,
			sensitivity = 0,
			touchpad = {
				natural_scroll = true,
			},
		},

		gestures = {
			workspace_swipe = false,
		},
	})

	hl.input_device({
		name = "epic-mouse-v1",
		sensitivity = -0.5,
	})
end

return M
