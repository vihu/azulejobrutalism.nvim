local theme = require("azulejo-brutalism.colors").setup().theme

local azulejo = {}

azulejo.normal = {
	a = { bg = theme.ui.primary, fg = theme.ui.fg_reverse },
	b = { bg = theme.ui.bg_tile, fg = theme.ui.primary },
	c = { bg = theme.ui.bg_m3, fg = theme.ui.fg },
}

azulejo.insert = {
	a = { bg = theme.diag.ok, fg = theme.ui.fg_reverse },
	b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

azulejo.command = {
	a = { bg = theme.ui.accent, fg = theme.ui.on_accent },
	b = { bg = theme.ui.bg, fg = theme.ui.accent },
}

azulejo.visual = {
	a = { bg = theme.syn.type, fg = theme.ui.fg_reverse },
	b = { bg = theme.ui.bg, fg = theme.syn.type },
}

azulejo.replace = {
	a = { bg = theme.diag.error, fg = theme.ui.fg_reverse },
	b = { bg = theme.ui.bg, fg = theme.diag.error },
}

azulejo.inactive = {
	a = { bg = theme.ui.bg_m3, fg = theme.ui.special },
	b = { bg = theme.ui.bg_m3, fg = theme.ui.special, gui = "bold" },
	c = { bg = theme.ui.bg_m3, fg = theme.ui.special },
}

-- Mode labels are bold tiles.
for _, mode in pairs(azulejo) do
	mode.a.gui = "bold"
end

return azulejo
