---@class PaletteColors
local palette = {
	-- Glaze: light grounds
	glaze0 = "#F3F0E8", -- Glaze. Light background, dark foreground
	glaze1 = "#E8E4D9", -- light floats, statusline, cursorline
	glaze2 = "#DEDAD0", -- light surface (whitespace, scrollbar)
	glaze3 = "#D8D4C8", -- ANSI white

	-- Ink: dark grounds, from true black up to deep cobalt
	black = "#000000", -- OLED background
	ink0 = "#07091F", -- OLED floats, statusline, cursorline
	ink1 = "#0C1030", -- Ink. Dark background, light foreground, OLED surface
	ink2 = "#10154A", -- dark floats, statusline, cursorline
	ink3 = "#1A2150", -- dark surface (whitespace, scrollbar)
	ink4 = "#141B6B", -- dark ANSI black

	-- Slate: muted text on Glaze
	slate0 = "#3D4163", -- dimmed foreground, parameters, operators
	slate1 = "#5A5E78", -- comments, punctuation, ANSI bright black
	slate2 = "#8A8DA3", -- line numbers, non-text

	-- Mist: muted text on Ink
	mist0 = "#C9CBE0", -- dimmed foreground, parameters, operators
	mist1 = "#8A8FB5", -- comments, punctuation
	mist2 = "#6E7399", -- ANSI bright black
	mist3 = "#5A5F88", -- line numbers, non-text

	-- Blues
	cobalt = "#1E2A9E", -- Cobalt. Light primary, dark selection and grout
	cobalt2 = "#3A48C4", -- light ANSI bright blue
	wash = "#9FB2E4", -- Wash. Dark primary (Cobalt vanishes on Ink), light selection
	wash2 = "#C3CFF2", -- dark ANSI bright blue
	washTile = "#D6DAE7", -- light references, quickfix line

	-- Ochre: the one highlight
	ochre = "#D49A1A", -- cursor, current line number, search
	ochre2 = "#E8B84A", -- dark ANSI bright yellow
	ochreDark = "#B07A0C", -- light ANSI bright yellow
	ochreDeep = "#8F6200", -- numbers and warnings on Glaze

	-- Pigments fired for Glaze: iron red, copper green, manganese purple, teal
	ironRed = "#B03A2E",
	ironRed2 = "#C8513F",
	copperGreen = "#2F6B3A",
	copperGreen2 = "#3E8A4C",
	manganese = "#6B2E80",
	manganese2 = "#8A48A0",
	teal = "#1D6E7E",
	teal2 = "#2A8C9E",

	-- The same pigments, lifted for Ink
	terracotta = "#E0705A",
	terracotta2 = "#F08C78",
	verdigris = "#7CBF7A",
	verdigris2 = "#98D496",
	lilac = "#C08AD6",
	lilac2 = "#D6A8E6",
	aqua = "#6FC3CF",
	aqua2 = "#94D8E2",

	-- Diff tiles
	mossTile = "#DCE6D6", -- light add
	roseTile = "#F0D6CF", -- light delete
	skyTile = "#DDE2EF", -- light change
	mossInk = "#16304A", -- dark add
	plumInk = "#3A1A3A", -- dark delete
	cobaltInk = "#1A2466", -- dark change
}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to AzulejoConfig.colors.
---   - theme: Use selected theme. Defaults to AzulejoConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
	opts = opts or {}
	local override_colors = opts.colors or require("azulejo-brutalism").config.colors
	local theme = opts.theme or require("azulejo-brutalism")._CURRENT_THEME

	if not theme then
		error(
			"azulejo-brutalism.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme azulejo-brutalism'"
		)
	end

	-- Add to and/or override palette_colors
	local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

	-- Generate the theme according to the updated palette colors
	local theme_colors = require("azulejo-brutalism.themes")[theme](updated_palette_colors)

	-- Add to and/or override theme_colors
	local theme_colors_overrides = override_colors.theme or {}
	local theme_overrides =
		vim.tbl_deep_extend("force", theme_colors_overrides.all or {}, theme_colors_overrides[theme] or {})
	local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)

	return {
		theme = updated_theme_colors,
		palette = updated_palette_colors,
	}
end

return M
