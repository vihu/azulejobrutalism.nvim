local M = {}

---@param colors AzulejoColors
---@param config? AzulejoConfig
function M.setup(colors, config)
	local theme = colors.theme
	config = config or require("azulejo-brutalism").config

	local function curl(sp)
		return { undercurl = config.undercurl, underline = not config.undercurl, sp = sp }
	end

	return {
		-- ColorColumn	Used for the columns set with 'colorcolumn'.
		ColorColumn = { bg = theme.ui.bg_p1 },
		-- Conceal		Placeholder characters substituted for concealed text (see 'conceallevel').
		Conceal = { fg = theme.ui.special },
		-- CurSearch	Used for highlighting a search pattern under the cursor (see 'hlsearch').
		CurSearch = { link = "IncSearch" },
		-- Cursor		Character under the cursor.
		Cursor = { fg = theme.ui.on_accent, bg = theme.ui.accent },
		-- lCursor		Character under the cursor when |language-mapping| is used (see 'guicursor').
		lCursor = { link = "Cursor" },
		-- CursorIM	Like Cursor, but used when in IME mode.
		CursorIM = { link = "Cursor" },
		-- CursorColumn	Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorColumn = { link = "CursorLine" },
		-- CursorLine	Screen-line at the cursor, when 'cursorline' is set.
		CursorLine = { bg = theme.ui.bg_p2 },
		-- Directory	Directory names (and other special names in listings).
		Directory = { fg = theme.ui.primary, bold = true },
		-- DiffAdd		Diff mode: Added line. |diff.txt|
		DiffAdd = { bg = theme.diff.add },
		-- DiffChange	Diff mode: Changed line. |diff.txt|
		DiffChange = { bg = theme.diff.change },
		-- DiffDelete	Diff mode: Deleted line. |diff.txt|
		DiffDelete = { fg = theme.vcs.removed, bg = theme.diff.delete },
		-- DiffText	Diff mode: Changed text within a changed line. |diff.txt|
		DiffText = { bg = theme.diff.text, bold = true },
		-- EndOfBuffer	Filler lines (~) after the end of the buffer.
		EndOfBuffer = { fg = theme.ui.bg },
		-- ErrorMsg	Error messages on the command line.
		ErrorMsg = { fg = theme.diag.error, bold = true },
		-- WinSeparator	Separators between window splits: the grout between tiles.
		WinSeparator = { fg = theme.ui.border, bg = config.dimInactive and theme.ui.bg_dim or "NONE" },
		VertSplit = { link = "WinSeparator" },
		-- Folded		Line used for closed folds.
		Folded = { fg = theme.ui.special, bg = theme.ui.bg_p1 },
		-- FoldColumn	'foldcolumn'
		FoldColumn = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
		-- SignColumn	Column where |signs| are displayed.
		SignColumn = { fg = theme.ui.special, bg = theme.ui.bg_gutter },
		-- IncSearch	'incsearch' highlighting; also used for the text replaced with ":s///c".
		IncSearch = { fg = theme.ui.fg_reverse, bg = theme.ui.primary, bold = true },
		-- Substitute	|:substitute| replacement text highlighting.
		Substitute = { link = "IncSearch" },
		-- LineNr		Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNr = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
		-- CursorLineNr	Like LineNr when 'cursorline' is set for the cursor line.
		CursorLineNr = { fg = theme.ui.accent, bg = theme.ui.bg_gutter, bold = true },
		-- MatchParen	Character under the cursor or just before it, if it is a paired bracket, and its match.
		MatchParen = { fg = theme.ui.primary, bold = true, underline = true },
		-- ModeMsg		'showmode' message (e.g., "-- INSERT --").
		ModeMsg = { fg = theme.ui.fg, bold = true },
		-- MsgArea		Area for messages and cmdline.
		MsgArea = vim.o.cmdheight == 0 and { link = "StatusLine" } or { fg = theme.ui.fg_dim },
		-- MsgSeparator	Separator for scrolled messages |msgsep|.
		MsgSeparator = { bg = vim.o.cmdheight == 0 and theme.ui.bg or theme.ui.bg_m3, fg = theme.ui.border },
		-- MoreMsg		|more-prompt|
		MoreMsg = { fg = theme.ui.primary },
		-- NonText		'@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text.
		NonText = { fg = theme.ui.nontext },
		-- Normal		Normal text.
		Normal = { fg = theme.ui.fg, bg = not config.transparent and theme.ui.bg or "NONE" },
		-- NormalFloat	Normal text in floating windows.
		NormalFloat = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
		-- FloatBorder	Border of floating windows.
		FloatBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.float.bg_border },
		-- FloatTitle	Title of floating windows.
		FloatTitle = { fg = theme.ui.primary, bg = theme.ui.float.bg_border, bold = true },
		-- FloatFooter	Footer of floating windows.
		FloatFooter = { fg = theme.ui.nontext, bg = theme.ui.float.bg_border },
		-- NormalNC	Normal text in non-current windows.
		NormalNC = config.dimInactive and { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim } or { link = "Normal" },
		-- Pmenu		Popup menu: Normal item.
		Pmenu = { fg = theme.ui.pmenu.fg, bg = theme.ui.pmenu.bg },
		-- PmenuSel	Popup menu: Selected item.
		PmenuSel = { fg = theme.ui.pmenu.fg_sel, bg = theme.ui.pmenu.bg_sel, bold = true },
		-- PmenuKind	Popup menu: Normal item "kind".
		PmenuKind = { fg = theme.syn.type, bg = theme.ui.pmenu.bg },
		-- PmenuKindSel	Popup menu: Selected item "kind".
		PmenuKindSel = { fg = theme.ui.pmenu.fg_sel, bg = theme.ui.pmenu.bg_sel },
		-- PmenuExtra	Popup menu: Normal item "extra text".
		PmenuExtra = { fg = theme.ui.special, bg = theme.ui.pmenu.bg },
		-- PmenuExtraSel	Popup menu: Selected item "extra text".
		PmenuExtraSel = { fg = theme.ui.pmenu.fg_sel, bg = theme.ui.pmenu.bg_sel },
		-- PmenuSbar	Popup menu: Scrollbar.
		PmenuSbar = { bg = theme.ui.pmenu.bg_sbar },
		-- PmenuThumb	Popup menu: Thumb of the scrollbar.
		PmenuThumb = { bg = theme.ui.pmenu.bg_thumb },
		PmenuBorder = { link = "FloatBorder" },
		-- Question	|hit-enter| prompt and yes/no questions.
		Question = { link = "MoreMsg" },
		-- QuickFixLine	Current |quickfix| item in the quickfix window.
		QuickFixLine = { bg = theme.ui.bg_tile, bold = true },
		-- Search		Last search pattern highlighting (see 'hlsearch').
		Search = { fg = theme.ui.on_accent, bg = theme.ui.bg_search },
		-- SpecialKey	Unprintable characters: Text displayed differently from what it really is.
		SpecialKey = { fg = theme.ui.nontext },
		-- SpellBad	Word that is not recognized by the spellchecker.
		SpellBad = curl(theme.diag.error),
		-- SpellCap	Word that should start with a capital.
		SpellCap = curl(theme.diag.warning),
		-- SpellLocal	Word that is recognized by the spellchecker as one that is used in another region.
		SpellLocal = curl(theme.diag.hint),
		-- SpellRare	Word that is recognized by the spellchecker as one that is hardly ever used.
		SpellRare = curl(theme.syn.type),
		-- StatusLine	Status line of current window.
		StatusLine = { fg = theme.ui.fg, bg = theme.ui.bg_m3 },
		-- StatusLineNC	Status lines of not-current windows.
		StatusLineNC = { fg = theme.ui.special, bg = theme.ui.bg_m3 },
		-- TabLine		Tab pages line, not active tab page label.
		TabLine = { fg = theme.ui.special, bg = theme.ui.bg_m3 },
		-- TabLineFill	Tab pages line, where there are no labels.
		TabLineFill = { bg = theme.ui.bg_m3 },
		-- TabLineSel	Tab pages line, active tab page label: a primary tile.
		TabLineSel = { fg = theme.ui.fg_reverse, bg = theme.ui.primary, bold = true },
		-- Title		Titles for output from ":set all", ":autocmd" etc.
		Title = { fg = theme.ui.primary, bold = true },
		-- Visual		Visual mode selection.
		Visual = { bg = theme.ui.bg_visual },
		-- VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
		VisualNOS = { link = "Visual" },
		-- WarningMsg	Warning messages.
		WarningMsg = { fg = theme.diag.warning },
		-- Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
		Whitespace = { fg = theme.ui.whitespace },
		-- WildMenu	Current match in 'wildmenu' completion.
		WildMenu = { link = "PmenuSel" },
		-- WinBar		Window bar of current window.
		WinBar = { fg = theme.ui.fg, bg = "NONE", bold = true },
		-- WinBarNC	Window bar of not-current windows.
		WinBarNC = { fg = theme.ui.special, bg = config.dimInactive and theme.ui.bg_dim or "NONE" },

		debugPC = { bg = theme.diff.delete },
		debugBreakpoint = { fg = theme.syn.special1, bg = theme.ui.bg_gutter },

		LspReferenceText = { bg = theme.ui.bg_tile },
		LspReferenceRead = { link = "LspReferenceText" },
		LspReferenceWrite = { bg = theme.ui.bg_tile, underline = true },
		LspInlayHint = { fg = theme.ui.nontext, italic = true },

		DiagnosticError = { fg = theme.diag.error },
		DiagnosticWarn = { fg = theme.diag.warning },
		DiagnosticInfo = { fg = theme.diag.info },
		DiagnosticHint = { fg = theme.diag.hint },
		DiagnosticOk = { fg = theme.diag.ok },

		DiagnosticFloatingError = { fg = theme.diag.error },
		DiagnosticFloatingWarn = { fg = theme.diag.warning },
		DiagnosticFloatingInfo = { fg = theme.diag.info },
		DiagnosticFloatingHint = { fg = theme.diag.hint },
		DiagnosticFloatingOk = { fg = theme.diag.ok },

		DiagnosticSignError = { fg = theme.diag.error, bg = theme.ui.bg_gutter },
		DiagnosticSignWarn = { fg = theme.diag.warning, bg = theme.ui.bg_gutter },
		DiagnosticSignInfo = { fg = theme.diag.info, bg = theme.ui.bg_gutter },
		DiagnosticSignHint = { fg = theme.diag.hint, bg = theme.ui.bg_gutter },

		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

		DiagnosticUnderlineError = curl(theme.diag.error),
		DiagnosticUnderlineWarn = curl(theme.diag.warning),
		DiagnosticUnderlineInfo = curl(theme.diag.info),
		DiagnosticUnderlineHint = curl(theme.diag.hint),
		DiagnosticUnnecessary = { fg = theme.ui.nontext },

		LspSignatureActiveParameter = { fg = theme.ui.accent, bold = true },
		LspCodeLens = { fg = theme.syn.comment },

		-- vcs
		Added = { fg = theme.vcs.added },
		Removed = { fg = theme.vcs.removed },
		Changed = { fg = theme.vcs.changed },
		diffAdded = { fg = theme.vcs.added },
		diffRemoved = { fg = theme.vcs.removed },
		diffDeleted = { fg = theme.vcs.removed },
		diffChanged = { fg = theme.vcs.changed },
		diffOldFile = { fg = theme.vcs.removed },
		diffNewFile = { fg = theme.vcs.added },
	}
end

return M
