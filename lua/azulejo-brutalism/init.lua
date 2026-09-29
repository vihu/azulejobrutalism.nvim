local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias AzulejoColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias AzulejoColors { palette: PaletteColors, theme: ThemeColors }

--- default config
---@class AzulejoConfig
M.config = {
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = { bold = true },
	keywordStyle = { bold = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = { theme = { light = {}, dark = {}, oled = {}, all = {} }, palette = {} },
	---@type fun(colors: AzulejoColorsSpec): table<string, table>
	overrides = function()
		return {}
	end,
	---@type { dark: string, light: string }
	background = { dark = "dark", light = "light" },
	theme = "dark",
}

--- update global configuration with user settings
---@param config? AzulejoConfig user configuration
function M.setup(config)
	M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

--- load the colorscheme
---@param theme? string "light", "dark" or "oled"
function M.load(theme)
	theme = theme or M.config.background[vim.o.background] or M.config.theme
	M._CURRENT_THEME = theme

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.g.colors_name = "azulejo-brutalism"
	vim.o.termguicolors = true

	local colors = require("azulejo-brutalism.colors").setup({ theme = theme, colors = M.config.colors })
	local highlights = require("azulejo-brutalism.highlights").setup(colors, M.config)
	require("azulejo-brutalism.highlights").highlight(highlights, M.config.terminalColors and colors.theme.term or {})
end

return M
