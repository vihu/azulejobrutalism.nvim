---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec Specials, builtin functions, attributes
---@field special2 ColorSpec Builtin variables (`self`, `this`)
---@field special3 ColorSpec `return` and exception keywords

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec

---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec Text on `primary` (and other solid tiles)
---@field bg_dim ColorSpec Dimmed background
---@field bg_m3 ColorSpec StatusLine, TabLine
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec ColorColumn, Folded
---@field bg_p2 ColorSpec Cursor{Line,Column}
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field bg_tile ColorSpec Wash tile: LSP references, quickfix line, picker selection
---@field special ColorSpec Muted UI text: Folded, TabLine, float titles
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace, indent guides
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field border ColorSpec Grout: window separators and float borders
---@field primary ColorSpec Cobalt on Glaze, Wash on Ink
---@field accent ColorSpec Ochre, the one highlight
---@field on_accent ColorSpec Text on `accent`
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

local M = {}

---@param palette PaletteColors
---@return ThemeColors
function M.light(palette)
	return {
		ui = {
			fg = palette.ink1,
			fg_dim = palette.slate0,
			fg_reverse = palette.glaze0,

			bg_dim = palette.glaze1,
			bg_gutter = "none",

			bg_m3 = palette.glaze1,
			bg_m2 = palette.glaze1,
			bg_m1 = palette.glaze1,
			bg = palette.glaze0,
			bg_p1 = palette.glaze1,
			bg_p2 = palette.glaze1,
			bg_tile = palette.washTile,

			special = palette.slate1,
			nontext = palette.slate2,
			whitespace = palette.glaze2,

			bg_search = palette.ochre,
			bg_visual = palette.wash,

			border = palette.ink1,
			primary = palette.cobalt,
			accent = palette.ochre,
			on_accent = palette.ink1,

			pmenu = {
				fg = palette.ink1,
				fg_sel = palette.glaze0,
				bg = palette.glaze1,
				bg_sel = palette.cobalt,
				bg_sbar = palette.glaze2,
				bg_thumb = palette.slate1,
			},
			float = {
				fg = palette.ink1,
				bg = palette.glaze1,
				fg_border = palette.ink1,
				bg_border = palette.glaze1,
			},
		},
		syn = {
			string = palette.copperGreen,
			variable = "none",
			number = palette.ochreDeep,
			constant = palette.ochreDeep,
			identifier = palette.ink1,
			parameter = palette.slate0,
			fun = palette.ink1,
			statement = palette.cobalt,
			keyword = palette.cobalt,
			operator = palette.slate0,
			preproc = palette.manganese,
			type = palette.manganese,
			regex = palette.teal,
			deprecated = palette.slate2,
			comment = palette.slate1,
			punct = palette.slate1,
			special1 = palette.teal,
			special2 = palette.teal,
			special3 = palette.cobalt,
		},
		vcs = {
			added = palette.copperGreen,
			removed = palette.ironRed,
			changed = palette.cobalt,
		},
		diff = {
			add = palette.mossTile,
			delete = palette.roseTile,
			change = palette.skyTile,
			text = palette.wash,
		},
		diag = {
			ok = palette.copperGreen,
			error = palette.ironRed,
			warning = palette.ochreDeep,
			info = palette.cobalt,
			hint = palette.teal,
		},
		term = {
			palette.ink1, -- black
			palette.ironRed, -- red
			palette.copperGreen, -- green
			palette.ochreDeep, -- yellow
			palette.cobalt, -- blue
			palette.manganese, -- magenta
			palette.teal, -- cyan
			palette.glaze3, -- white
			palette.slate1, -- bright black
			palette.ironRed2, -- bright red
			palette.copperGreen2, -- bright green
			palette.ochreDark, -- bright yellow
			palette.cobalt2, -- bright blue
			palette.manganese2, -- bright magenta
			palette.teal2, -- bright cyan
			palette.glaze1, -- bright white
		},
	}
end

---@param palette PaletteColors
---@return ThemeColors
function M.dark(palette)
	return {
		ui = {
			fg = palette.glaze0,
			fg_dim = palette.mist0,
			fg_reverse = palette.ink1,

			bg_dim = palette.ink2,
			bg_gutter = "none",

			bg_m3 = palette.ink2,
			bg_m2 = palette.ink2,
			bg_m1 = palette.ink2,
			bg = palette.ink1,
			bg_p1 = palette.ink2,
			bg_p2 = palette.ink2,
			bg_tile = palette.cobalt,

			special = palette.mist1,
			nontext = palette.mist3,
			whitespace = palette.ink3,

			bg_search = palette.ochre,
			bg_visual = palette.cobalt,

			border = palette.cobalt,
			primary = palette.wash,
			accent = palette.ochre,
			on_accent = palette.ink1,

			pmenu = {
				fg = palette.glaze0,
				fg_sel = palette.ink1,
				bg = palette.ink2,
				bg_sel = palette.wash,
				bg_sbar = palette.ink3,
				bg_thumb = palette.mist1,
			},
			float = {
				fg = palette.glaze0,
				bg = palette.ink2,
				fg_border = palette.cobalt,
				bg_border = palette.ink2,
			},
		},
		syn = {
			string = palette.verdigris,
			variable = "none",
			number = palette.ochre,
			constant = palette.ochre,
			identifier = palette.glaze0,
			parameter = palette.mist0,
			fun = palette.glaze0,
			statement = palette.wash,
			keyword = palette.wash,
			operator = palette.mist0,
			preproc = palette.lilac,
			type = palette.lilac,
			regex = palette.aqua,
			deprecated = palette.mist3,
			comment = palette.mist1,
			punct = palette.mist1,
			special1 = palette.aqua,
			special2 = palette.aqua,
			special3 = palette.wash,
		},
		vcs = {
			added = palette.verdigris,
			removed = palette.terracotta,
			changed = palette.wash,
		},
		diff = {
			add = palette.mossInk,
			delete = palette.plumInk,
			change = palette.cobaltInk,
			text = palette.cobalt,
		},
		diag = {
			ok = palette.verdigris,
			error = palette.terracotta,
			warning = palette.ochre,
			info = palette.wash,
			hint = palette.aqua,
		},
		term = {
			palette.ink4, -- black
			palette.terracotta, -- red
			palette.verdigris, -- green
			palette.ochre, -- yellow
			palette.wash, -- blue
			palette.lilac, -- magenta
			palette.aqua, -- cyan
			palette.glaze3, -- white
			palette.mist2, -- bright black
			palette.terracotta2, -- bright red
			palette.verdigris2, -- bright green
			palette.ochre2, -- bright yellow
			palette.wash2, -- bright blue
			palette.lilac2, -- bright magenta
			palette.aqua2, -- bright cyan
			palette.glaze0, -- bright white
		},
	}
end

--- OLED: Dark with true black behind everything; surfaces sink one step toward black.
---@param palette PaletteColors
---@return ThemeColors
function M.oled(palette)
	local theme = vim.tbl_deep_extend("force", M.dark(palette), {
		ui = {
			fg_reverse = palette.black,
			bg_dim = palette.ink0,
			bg_m3 = palette.ink0,
			bg_m2 = palette.ink0,
			bg_m1 = palette.ink0,
			bg = palette.black,
			bg_p1 = palette.ink0,
			bg_p2 = palette.ink0,
			whitespace = palette.ink1,
			on_accent = palette.black,
			pmenu = { fg_sel = palette.black, bg = palette.ink0, bg_sbar = palette.ink1 },
			float = { bg = palette.ink0, bg_border = palette.ink0 },
		},
	})
	theme.term[1] = palette.ink1
	return theme
end

return M
