-- Azulejo Brutalism OLED for WezTerm. Usage: config.colors = dofile("/path/to/this/file.lua")
return {
	foreground = "#F3F0E8",
	background = "#000000",

	cursor_bg = "#D49A1A",
	cursor_fg = "#000000",
	cursor_border = "#D49A1A",
	compose_cursor = "#9FB2E4",

	selection_fg = "#F3F0E8",
	selection_bg = "#1E2A9E",

	scrollbar_thumb = "#8A8FB5",
	split = "#1E2A9E",

	ansi = { "#0C1030", "#E0705A", "#7CBF7A", "#D49A1A", "#9FB2E4", "#C08AD6", "#6FC3CF", "#D8D4C8" },
	brights = { "#6E7399", "#F08C78", "#98D496", "#E8B84A", "#C3CFF2", "#D6A8E6", "#94D8E2", "#F3F0E8" },

	copy_mode_active_highlight_fg = { Color = "#000000" },
	copy_mode_active_highlight_bg = { Color = "#D49A1A" },
	copy_mode_inactive_highlight_fg = { Color = "#F3F0E8" },
	copy_mode_inactive_highlight_bg = { Color = "#1E2A9E" },
	quick_select_label_fg = { Color = "#000000" },
	quick_select_label_bg = { Color = "#D49A1A" },
	quick_select_match_fg = { Color = "#F3F0E8" },
	quick_select_match_bg = { Color = "#1E2A9E" },

	tab_bar = {
		background = "#07091F",
		inactive_tab_edge = "#1E2A9E",
		active_tab = { fg_color = "#000000", bg_color = "#9FB2E4", intensity = "Bold" },
		inactive_tab = { fg_color = "#8A8FB5", bg_color = "#07091F" },
		inactive_tab_hover = { fg_color = "#F3F0E8", bg_color = "#1E2A9E" },
		new_tab = { fg_color = "#8A8FB5", bg_color = "#07091F" },
		new_tab_hover = { fg_color = "#F3F0E8", bg_color = "#1E2A9E" },
	},
}
