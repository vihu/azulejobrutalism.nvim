local M = {}

---@param colors AzulejoColors
---@param config? AzulejoConfig
function M.setup(colors, config)
	config = config or require("azulejo-brutalism").config
	local theme = colors.theme
	return {
		-- @variable                       various variable names
		["@variable"] = { fg = theme.ui.fg },
		-- @variable.builtin (Special)     built-in variable names (e.g. `this`, `self`)
		["@variable.builtin"] = { fg = theme.syn.special2, italic = true },
		-- @variable.parameter             parameters of a function
		["@variable.parameter"] = { fg = theme.syn.parameter },
		-- @variable.member                object and struct fields
		["@variable.member"] = { fg = theme.syn.identifier },
		--
		-- @constant.builtin       built-in constant values
		["@constant.builtin"] = { fg = theme.syn.constant, bold = true },
		--
		-- @string.regexp          regular expressions
		["@string.regexp"] = { fg = theme.syn.regex },
		-- @string.escape          escape sequences
		["@string.escape"] = { fg = theme.syn.regex },
		-- @string.special.url (Underlined)     URIs (e.g. hyperlinks)
		["@string.special.url"] = { fg = theme.ui.primary, underline = true },
		--
		-- @type.builtin           built-in types
		["@type.builtin"] = vim.tbl_extend("force", { fg = theme.syn.type, italic = true }, config.typeStyle),
		--
		-- @attribute              attribute annotations (e.g. Python decorators, Rust lifetimes)
		["@attribute"] = { fg = theme.syn.special1 },
		--
		-- @function.builtin       built-in functions
		["@function.builtin"] = { fg = theme.syn.special1, bold = true },
		-- @function.call          function calls: definitions carry the weight, calls stay plain
		["@function.call"] = { fg = theme.syn.fun },
		-- @function.method.call   method calls
		["@function.method.call"] = { link = "@function.call" },
		-- @function.macro         preprocessor macros
		["@function.macro"] = { link = "Macro" },
		--
		-- @constructor            constructor calls and definitions
		["@constructor"] = { fg = theme.syn.type, bold = true },
		["@constructor.lua"] = { fg = theme.syn.punct },
		-- @operator               symbolic operators (e.g. `+`, `*`)
		["@operator"] = { link = "Operator" },
		--
		-- @keyword.operator       operators that are English words (e.g. `and`, `or`)
		["@keyword.operator"] = { fg = theme.syn.operator, bold = true },
		-- @keyword.import         keywords for including modules (e.g. `import`, `from` in Python)
		["@keyword.import"] = { link = "Include" },
		-- @keyword.return         keywords like `return` and `yield`
		["@keyword.return"] = vim.tbl_extend("force", { fg = theme.syn.special3 }, config.keywordStyle),
		-- @keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)
		["@keyword.exception"] = vim.tbl_extend("force", { fg = theme.syn.special3 }, config.statementStyle),
		["@keyword.luap"] = { link = "@string.regexp" },
		--
		-- @punctuation.delimiter  delimiters (e.g. `;`, `.`, `,`)
		["@punctuation.delimiter"] = { fg = theme.syn.punct },
		-- @punctuation.bracket    brackets (e.g. `()`, `{}`, `[]`)
		["@punctuation.bracket"] = { fg = theme.syn.punct },
		-- @punctuation.special    special symbols (e.g. `{}` in string interpolation)
		["@punctuation.special"] = { fg = theme.syn.special1 },
		--
		-- @comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
		["@comment.error"] = { fg = theme.ui.fg_reverse, bg = theme.diag.error, bold = true },
		-- @comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
		["@comment.warning"] = { fg = theme.ui.on_accent, bg = theme.ui.accent, bold = true },
		-- @comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
		["@comment.todo"] = { link = "Todo" },
		-- @comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
		["@comment.note"] = { fg = theme.ui.fg_reverse, bg = theme.ui.primary, bold = true },
		--
		-- @markup.strong          bold text
		["@markup.strong"] = { bold = true },
		-- @markup.italic          italic text
		["@markup.italic"] = { italic = true },
		-- @markup.strikethrough   struck-through text
		["@markup.strikethrough"] = { strikethrough = true },
		-- @markup.underline       underlined text (only for literal underline markup!)
		["@markup.underline"] = { underline = true },
		-- @markup.heading         headings, titles (including markers)
		["@markup.heading"] = { fg = theme.ui.primary, bold = true },
		-- @markup.quote           block quotes
		["@markup.quote"] = { fg = theme.syn.parameter, italic = true },
		-- @markup.math            math environments (e.g. `$ ... $` in LaTeX)
		["@markup.math"] = { link = "Constant" },
		-- @markup.environment     environments (e.g. in LaTeX)
		["@markup.environment"] = { link = "Keyword" },
		-- @markup.link            text references, footnotes, citations, etc.
		["@markup.link"] = { fg = theme.ui.primary },
		-- @markup.link.url        URL-style links
		["@markup.link.url"] = { link = "@string.special.url" },
		-- @markup.raw             literal or verbatim text (e.g. inline code)
		["@markup.raw"] = { link = "String" },
		-- @markup.list            list markers
		["@markup.list"] = { fg = theme.ui.primary },
		--
		-- @diff.plus              added text (for diff files)
		["@diff.plus"] = { fg = theme.vcs.added },
		-- @diff.minus             deleted text (for diff files)
		["@diff.minus"] = { fg = theme.vcs.removed },
		-- @diff.delta             changed text (for diff files)
		["@diff.delta"] = { fg = theme.vcs.changed },
		--
		-- @tag                    XML-style tag names (e.g. in XML, HTML, etc.)
		["@tag"] = { fg = theme.ui.primary, bold = true },
		-- @tag.attribute          XML-style tag attributes
		["@tag.attribute"] = { fg = theme.syn.type },
		-- @tag.delimiter          XML-style tag delimiters
		["@tag.delimiter"] = { fg = theme.syn.punct },
	}
end

return M
