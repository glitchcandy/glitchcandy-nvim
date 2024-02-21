---@class Highlight
---@field fg string color name or "#RRGGBB"
---@field foreground string same fg, color name or "#RRGGBB"
---@field bg string color name or "#RRGGBB"
---@field background string same bg, color name or "#RRGGBB"
---@field sp string color name or "#RRGGBB"
---@field special string same sg, color name or "#RRGGBB"
---@field blend integer value between 0 and 100
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string name of another highlight group to link to, see |:hi-link|.
---@field default string Don't override existing definition |:hi-default|
---@field ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@field ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@field cterm table cterm attribute map, like |highlight-args|.

---setup highlight groups
---@return table<string, Highlight>
---@nodiscard
local function setup()
	local colors = require("glitchcandy.palette")

	return {
		Normal = { fg = colors.fg, bg = colors.bg, },
		NormalFloat = { fg = colors.fg, bg = colors.bg, },
		Comment = { fg = colors.fg_alt, bg = colors.bg_alt, italic = true, },
		Constant = { fg = colors.orange, },
		String = { fg = colors.orange, },
		Character = { fg = colors.orange_alt, },
		Number = { fg = colors.blue, },
		Boolean = { fg = colors.blue, },
		Float = { fg = colors.blue_alt, },
		FloatBorder = { fg = colors.fg, },
		Operator = { fg = colors.pink_alt, },
		Keyword = { fg = colors.pink, },
		Keywords = { fg = colors.pink, },
		Identifier = { fg = colors.purple, },
		Function = { fg = colors.green, },
		Statement = { fg = colors.pink, },
		Conditional = { fg = colors.pink, },
		Repeat = { fg = colors.pink, },
		Label = { fg = colors.pink, },
		Exception = { fg = colors.red, },
		PreProc = { fg = colors.purple, },
		Include = { fg = colors.purple, },
		Define = { fg = colors.purple, },
		Title = { fg = colors.cyan, },
		Macro = { fg = colors.purple, },
		PreCondit = { fg = colors.purple, },
		Type = { fg = colors.cyan, },
		StorageClass = { fg = colors.cyan, },
		Structure = { fg = colors.cyan, },
		TypeDef = { fg = colors.cyan, },
		Special = { fg = colors.orange_alt, italic = true },
		SpecialComment = { fg = colors.fg_alt, bold = true, italic = true },
		Error = { fg = colors.red_alt, },
		Todo = { fg = colors.cyan, bold = true, italic = true, },
		Underlined = { underline = true, },

		Cursor = { reverse = true, },
		CursorLineNr = { fg = colors.fg, bold = true, },

		SignColumn = { bg = colors.bg, },

		Conceal = { fg = colors.fg_alt, },
		CursorColumn = { bg = colors.bg_alt, },
		CursorLine = { bg = colors.bg_alt, },
		ColorColumn = { bg = colors.bg_alt, },

		StatusLine = { fg = colors.fg, bg = colors.bg_alt, },
		StatusLineNC = { fg = colors.fg_alt, },
		StatusLineTerm = { fg = colors.fg, bg = colors.bg_alt, },
		StatusLineTermNC = { fg = colors.fg_alt, },

		Directory = { fg = colors.cyan, },
		DiffAdd = { fg = colors.bg, bg = colors.green, },
		DiffChange = { fg = colors.orange, },
		DiffDelete = { fg = colors.red, },
		DiffText = { fg = colors.fg_alt, },

		ErrorMsg = { fg = colors.red_alt, },
		VertSplit = { fg = colors.bg_alt, },
		Folded = { fg = colors.fg_alt, },
		FoldColumn = {},
		Search = { fg = colors.bg_alt, bg = colors.orange, },
		IncSearch = { fg = colors.fg, bg = colors.orange, },
		LineNr = { fg = colors.fg_alt, },
		MatchParen = { fg = colors.fg, underline = true, },
		NonText = { fg = colors.bg_alt, },
		Pmenu = { fg = colors.fg, bg = colors.bg_alt, },
		PmenuSel = { fg = colors.fg, bg = colors.orange, },
		PmenuSbar = { bg = colors.bg_alt, },
		PmenuThumb = { bg = colors.bg_alt, },

		Question = { fg = colors.purple, },
		QuickFixLine = { fg = colors.bg_alt, bg = colors.yellow, },
		SpecialKey = { fg = colors.bg_alt, },

		SpellBad = { fg = colors.red_alt, underline = true, },
		SpellCap = { fg = colors.yellow, },
		SpellLocal = { fg = colors.yellow, },
		SpellRare = { fg = colors.yellow, },

		TabLine = { fg = colors.fg_alt, bg = colors.bg_alt, },
		TabLineSel = { fg = colors.fg, bg = colors.bg, },
		TabLineFill = { bg = colors.bg_alt, },
		Terminal = { fg = colors.fg, bg = colors.bg, },
		Visual = { fg = colors.fg, bg = colors.orange, },
		VisualNOS = { fg = colors.orange, bg = colors.fg, },
		WarningMsg = { fg = colors.yellow, },
		WildMenu = { fg = colors.bg, bg = colors.fg, },

		EndOfBuffer = { fg = colors.bg },

		-- TreeSitter
		['@variable'] = { fg = colors.purple, },
		['@variable.builtin'] = { fg = colors.purple_alt, },
		['@variable.parameter'] = { link = "@variable.builtin", },
		['@variable.member'] = { link = "@variable", },

		['@constant'] = { fg = colors.orange, },
		['@constant.builtin'] = { fg = colors.orange_alt, },
		['@constant.macro'] = { link = "@constant.builtin", },

		['@module'] = { fg = colors.yellow, },
		['@module.builtin'] = { fg = colors.yellow_alt, },
		['@label'] = { fg = colors.yellow_alt, },

		['@string'] = { fg = colors.green, },
		['@string.documentation'] = { fg = colors.green_alt, },
		['@string.regex'] = { fg = colors.red, },
		['@string.escape'] = { fg = colors.green_alt, },
		['@string.special'] = { link = "@string.escape", },
		['@string.symbol'] = { link = "@string.escape", },
		['@string.path'] = { fg = colors.cyan, },
		['@string.url'] = { fg = colors.cyan, undercurl = true, },

		['@character'] = { fg = colors.green_alt, },
		['@character.special'] = { link = "@character", bold = true, },

		['@boolean'] = { fg = colors.blue, },
		['@number'] = { link = "@boolean" },
		['@number.float'] = { fg = colors.blue_alt, },

		['@type'] = { fg = colors.cyan, italic = true, },
		['@type.builtin'] = { link = "@type", fg = colors.cyan_alt, },
		['@type.definition'] = { fg = colors.pink_alt, },
		['@type.qualifier'] = { link = "@type.definition", },

		['@attribute'] = { fg = colors.yellow, },
		['@property'] = { fg = colors.purple, italic = true, },

		['@function'] = { fg = colors.green, italic = true, },
		['@function.builtin'] = { link = "@function", fg = colors.green_alt, },
		['@function.call'] = { link = "@function" },
		['@function.macro'] = { link = "@function", bold = true, },

		['@function.method'] = { link = "@function" },
		['@function.method.call'] = { link = "@function" },

		['@constructor'] = { link = "@function.call", },
		['@operator'] = { fg = colors.pink, italic = true, bold = true, },

		['@keyword'] = { fg = colors.pink, bold = true, },
		['@keyword.coroutine'] = { fg = colors.pink, italic = true, },
		['@keyword.function'] = { link = "@keyword", },
		['@keyword.operator'] = { link = "@keyword", },
		['@keyword.import'] = { link = "@keyword", },
		['@keyword.storage'] = { link = "@keyword", },
		['@keyword.repeat'] = { link = "@keyword", },
		['@keyword.return'] = { link = "@keyword", },
		['@keyword.debug'] = { link = "@keyword", },
		['@keyword.exception'] = { link = "@keyword", },

		['@keyword.conditional'] = { link = "@keyword", },
		['@keyword.conditional.ternary'] = { link = "@keyword", italic = true },

		['@keyword.directive'] = { link = "@keyword", italic = true },
		['@keyword.directive.define'] = { link = "@keyword", italic = true },

		['@punctuation.delimiter'] = { fg = colors.orange, },
		['@punctuation.bracket'] = { link = "@punctuation.delimiter" },
		['@punctuation.special'] = { link = "@punctuation.special", },

		['@comment'] = { fg = colors.fg_alt, bg = colors.bg_alt, italic = true, },
		['@comment.documentation'] = { link = "@comment", },

		['@comment.error'] = { link = "@comment", fg = colors.red, },
		['@comment.warning'] = { link = "@comment", fg = colors.yellow, },
		['@comment.todo'] = { link = "@comment", fg = colors.cyan, },
		['@comment.note'] = { link = "@comment", fg = colors.cyan_alt, },

		['@markup.strong'] = { bold = true, },
		['@markup.italic'] = { italic = true, },
		['@markup.strikethrough'] = { strikethrough = true, },
		['@markup.underline'] = { underline = true, },

		['@markup.heading'] = { fg = colors.purple, bold = true, underline = true, },

		['@markup.quote'] = { fg = colors.yellow, bg = colors.bg_alt, italic = true, },
		['@markup.math'] = { fg = colors.yellow_alt, bg = colors.bg_alt, },
		['@markup.environment'] = { fg = colors.yellow, bg = colors.bg_alt, },

		['@markup.link'] = { fg = colors.cyan, italic = true, undercurl = true, },
		['@markup.link.label'] = { link = "@markup.link", },
		['@markup.link.url'] = { link = "@markup.link", },

		['@markup.raw'] = { fg = colors.orange, bg = colors.bg_alt, italic = true, },
		['@markup.raw.block'] = { link = "@markup.raw", },

		['@markup.list'] = { fg = colors.cyan, bold = true, },
		['@markup.list.checked'] = { fg = colors.fg_alt, },
		['@markup.list.unchecked'] = { fg = colors.cyan, bold = true, },

		['@diff.plus'] = { fg = colors.green, },
		['@diff.minus'] = { fg = colors.red, },
		['@diff.delta'] = { fg = colors.yellow, },

		['@tag'] = { fg = colors.blue, },
		['@tag.attribute'] = { fg = colors.green, },
		['@tag.delimiter'] = { fg = colors.blue_alt, },

		-- Mode Highlights
		NormalMode = { fg = colors.purple },
		InsertMode = { fg = colors.green },
		VisualMode = { fg = colors.pink },
		CommandMode = { fg = colors.cyan },
		ReplaceMode = { fg = colors.yellow },
		SelectMode = { fg = colors.pink },
		TerminalMode = { fg = colors.green_alt },

		-- HTML
		htmlArg = { fg = colors.green, },
		htmlBold = { fg = colors.yellow, bold = true, },
		htmlEndTag = { fg = colors.blue, },
		htmlH1 = { fg = colors.pink, },
		htmlH2 = { fg = colors.pink, },
		htmlH3 = { fg = colors.pink, },
		htmlH4 = { fg = colors.pink, },
		htmlH5 = { fg = colors.pink, },
		htmlH6 = { fg = colors.pink, },
		htmlItalic = { fg = colors.purple, italic = true, },
		htmlLink = { fg = colors.cyan, undercurl = true, },
		htmlSpecialChar = { fg = colors.yellow, },
		htmlSpecialTagName = { fg = colors.blue, },
		htmlTag = { fg = colors.blue, },
		htmlTagN = { fg = colors.blue_alt, },
		htmlTagName = { fg = colors.blue_alt, },
		htmlTitle = { fg = colors.fg, },

		-- Markdown
		markdownBlockquote = { fg = colors.fg_alt, italic = true, },
		markdownBold = { fg = colors.orange, bold = true, },
		markdownCode = { fg = colors.green, },
		markdownCodeBlock = { fg = colors.green, },
		markdownCodeDelimiter = { fg = colors.red, },
		markdownH1 = { fg = colors.purple, bold = true, },
		markdownH2 = { link = "markdownH1" },
		markdownH3 = { link = "markdownH1" },
		markdownH4 = { link = "markdownH1" },
		markdownH5 = { link = "markdownH1" },
		markdownH6 = { link = "markdownH1" },
		markdownHeadingDelimiter = { fg = colors.red, },
		markdownHeadingRule = { fg = colors.fg_alt, },
		markdownId = { fg = colors.purple, },
		markdownIdDeclaration = { fg = colors.cyan, },
		markdownIdDelimiter = { fg = colors.purple, },
		markdownItalic = { fg = colors.yellow, italic = true, },
		markdownLinkDelimiter = { fg = colors.blue_alt, },
		markdownLinkText = { fg = colors.blue, },
		markdownListMarker = { fg = colors.cyan, },
		markdownOrderedListMarker = { fg = colors.red, },
		markdownRule = { fg = colors.fg_alt, },

		-- Diff
		diffAdded = { fg = colors.green, bg = colors.bg_alt, },
		diffRemoved = { fg = colors.red, bg = colors.bg_alt, },
		diffFileId = { fg = colors.yellow, bg = colors.bg_alt, bold = true, reverse = true, },
		diffFile = { fg = colors.fg_alt, bg = colors.bg_alt, },
		diffNewFile = { fg = colors.green, bg = colors.bg_alt, },
		diffOldFile = { fg = colors.red, bg = colors.bg_alt, },

		-- Debug
		debugPc = { bg = colors.cyan, },
		debugBreakpoint = { fg = colors.red, reverse = true, },

		-- Git Signs
		GitSignsAdd = { fg = colors.green_alt, },
		GitSignsChange = { fg = colors.cyan, },
		GitSignsDelete = { fg = colors.red_alt, },
		GitSignsAddLn = { fg = colors.bg, bg = colors.green_alt, },
		GitSignsChangeLn = { fg = colors.bg, bg = colors.cyan, },
		GitSignsDeleteLn = { fg = colors.bg, bg = colors.red_alt, },
		GitSignsCurrentLineBlame = { fg = colors.fg, },

		-- LSP
		DiagnosticError = { fg = colors.red, },
		DiagnosticWarn = { fg = colors.yellow, },
		DiagnosticInfo = { fg = colors.cyan, },
		DiagnosticHint = { fg = colors.cyan, },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
		DiagnosticSignError = { fg = colors.red, },
		DiagnosticSignWarn = { fg = colors.yellow, },
		DiagnosticSignInfo = { fg = colors.cyan, },
		DiagnosticSignHint = { fg = colors.cyan, },
		DiagnosticFloatingError = { fg = colors.red, },
		DiagnosticFloatingWarn = { fg = colors.yellow, },
		DiagnosticFloatingInfo = { fg = colors.cyan, },
		DiagnosticFloatingHint = { fg = colors.cyan, },
		DiagnosticVirtualTextError = { fg = colors.red, },
		DiagnosticVirtualTextWarn = { fg = colors.yellow, },
		DiagnosticVirtualTextInfo = { fg = colors.cyan, },
		DiagnosticVirtualTextHint = { fg = colors.cyan, },

		LspDiagnosticsDefaultError = { fg = colors.red, },
		LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
		LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
		LspDiagnosticsDefaultHint = { fg = colors.cyan, },
		LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
		LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
		LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
		LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
		LspReferenceText = { fg = colors.orange, },
		LspReferenceRead = { fg = colors.orange, },
		LspReferenceWrite = { fg = colors.orange, },
		LspCodeLens = { fg = colors.cyan, },

		-- Cmp
		CmpItemKind = { link = "Pmenu" },
		CmpItemAbbr = { link = "Pmenu" },
		CmpItemKindMethod = { link = "@function.method" },
		CmpItemKindText = { link = "@string" },
		CmpItemKindFunction = { link = "@function" },
		CmpItemKindConstructor = { link = "@type" },
		CmpItemKindVariable = { link = "@variable" },
		CmpItemKindClass = { link = "@type" },
		CmpItemKindInterface = { link = "@type" },
		CmpItemKindModule = { link = "@module" },
		CmpItemKindProperty = { link = "@property" },
		CmpItemKindOperator = { link = "@operator" },
		CmpItemKindReference = { link = "@variable.parameter" },
		CmpItemKindUnit = { link = "@keyword" },
		CmpItemKindValue = { link = "@property" },
		CmpItemKindField = { link = "@property" },
		CmpItemKindEnum = { link = "@constant" },
		CmpItemKindKeyword = { link = "@keyword" },
		CmpItemKindSnippet = { link = "@string.special" },
		CmpItemKindColor = { link = "DevIconCss" },
		CmpItemKindFile = { link = "@string.path" },
		CmpItemKindFolder = { link = "@string.path" },
		CmpItemKindEvent = { link = "@function" },
		CmpItemKindEnumMember = { link = "@constant" },
		CmpItemKindConstant = { link = "@constant" },
		CmpItemKindStruct = { link = "@type" },
		CmpItemKindTypeParameter = { link = "@variable.parameter" },
	}
end

return {
	setup = setup,
}
