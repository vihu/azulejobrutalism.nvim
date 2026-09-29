local M = {}

--- Few colours: keywords carry the primary, weight carries structure, pigments mark literals and types.
---@param colors AzulejoColors
---@param config? AzulejoConfig
function M.setup(colors, config)
	local theme = colors.theme
	config = config or require("azulejo-brutalism").config

	return {
		-- *Comment	any comment
		Comment = vim.tbl_extend("force", { fg = theme.syn.comment }, config.commentStyle),

		-- *Constant	any constant
		Constant = { fg = theme.syn.constant },
		--  String		a string constant: "this is a string"
		String = { fg = theme.syn.string },
		--  Character	a character constant: 'c', '\n'
		Character = { link = "String" },
		--  Number		a number constant: 234, 0xff
		Number = { fg = theme.syn.number },
		--  Boolean	a boolean constant: TRUE, false
		Boolean = { fg = theme.syn.constant, bold = true },
		--  Float		a floating point constant: 2.3e10
		Float = { link = "Number" },

		-- *Identifier	any variable name
		Identifier = { fg = theme.syn.identifier },
		--  Function	function name (also: methods for classes)
		Function = vim.tbl_extend("force", { fg = theme.syn.fun }, config.functionStyle),

		-- *Statement	any statement
		Statement = vim.tbl_extend("force", { fg = theme.syn.statement }, config.statementStyle),
		--  Conditional	if, then, else, endif, switch, etc.
		--  Repeat		for, do, while, etc.
		--  Label		case, default, etc.
		--  Operator	"sizeof", "+", "*", etc.
		Operator = { fg = theme.syn.operator },
		--  Keyword	any other keyword
		Keyword = vim.tbl_extend("force", { fg = theme.syn.keyword }, config.keywordStyle),
		--  Exception	try, catch, throw
		Exception = vim.tbl_extend("force", { fg = theme.syn.special3 }, config.statementStyle),

		-- *PreProc	generic Preprocessor
		PreProc = { fg = theme.syn.preproc },
		--  Include	preprocessor #include
		Include = { link = "Keyword" },
		--  Define		preprocessor #define
		--  Macro		same as Define
		--  PreCondit	preprocessor #if, #else, #endif, etc.

		-- *Type		int, long, char, etc.
		Type = vim.tbl_extend("force", { fg = theme.syn.type }, config.typeStyle),
		--  StorageClass	static, register, volatile, etc.
		StorageClass = { link = "Keyword" },
		--  Structure	struct, union, enum, etc.
		--  Typedef	A typedef

		-- *Special	any special symbol
		Special = { fg = theme.syn.special1 },
		--  SpecialChar	special character in a constant
		--  Tag		you can use CTRL-] on this
		Tag = { fg = theme.ui.primary },
		--  Delimiter	character that needs attention
		Delimiter = { fg = theme.syn.punct },
		--  SpecialComment	special things inside a comment
		SpecialComment = { fg = theme.syn.comment, bold = true },
		--  Debug		debugging statements

		-- *Underlined	text that stands out, HTML links
		Underlined = { fg = theme.ui.primary, underline = true },
		Bold = { bold = true },
		Italic = { italic = true },

		-- *Ignore		left blank, hidden  |hl-Ignore|
		Ignore = { link = "NonText" },

		-- *Error		any erroneous construct
		Error = { fg = theme.diag.error },

		-- *Todo		anything that needs extra attention; mostly the keywords TODO FIXME WARNING and XXX
		Todo = { fg = theme.ui.on_accent, bg = theme.ui.accent, bold = true },

		qfLineNr = { link = "LineNr" },
		qfFileName = { link = "Directory" },

		markdownCode = { fg = theme.syn.string },
		markdownCodeBlock = { fg = theme.syn.string },
		markdownEscape = { fg = "NONE" },
	}
end

return M
