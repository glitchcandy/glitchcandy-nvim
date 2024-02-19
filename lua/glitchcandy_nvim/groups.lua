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
	local colors = require("glitchcandy_nvim.palette")

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

		SignColumn = { bg = colors.bg_alt, },

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

		-- Mode Highlights
		NormalMode = { fg = colors.purple },
		InsertMode = { fg = colors.green },
		VisualMode = { fg = colors.pink },
		CommandMode = { fg = colors.cyan },
		ReplaceMode = { fg = colors.yellow },
		SelectMode = { fg = colors.pink },
		TerminalMode = { fg = colors.green_alt },

		-- TreeSitter
		-- ['@error'] = { fg = colors.bright_red, },
		-- ['@punctuation.delimiter'] = { fg = colors.fg, },
		-- ['@punctuation.bracket'] = { fg = colors.fg, },
		-- ['@punctuation.special'] = { fg = colors.cyan, },

		-- ['@constant'] = { fg = colors.purple, },
		-- ['@constant.builtin'] = { fg = colors.purple, },
		-- ['@symbol'] = { fg = colors.purple, },

		-- ['@constant.macro'] = { fg = colors.cyan, },
		-- ['@string.regex'] = { fg = colors.red, },
		-- ['@string'] = { fg = colors.yellow, },
		-- ['@string.escape'] = { fg = colors.cyan, },
		-- ['@character'] = { fg = colors.green, },
		-- ['@number'] = { fg = colors.purple, },
		-- ['@boolean'] = { fg = colors.purple, },
		-- ['@float'] = { fg = colors.green, },
		-- ['@annotation'] = { fg = colors.yellow, },
		-- ['@attribute'] = { fg = colors.cyan, },
		-- ['@namespace'] = { fg = colors.orange, },

		-- ['@function.builtin'] = { fg = colors.cyan, },
		-- ['@function'] = { fg = colors.green, },
		-- ['@function.macro'] = { fg = colors.green, },
		-- ['@parameter'] = { fg = colors.orange, },
		-- ['@parameter.reference'] = { fg = colors.orange, },
		-- ['@method'] = { fg = colors.green, },
		-- ['@field'] = { fg = colors.orange, },
		-- ['@property'] = { fg = colors.purple, },
		-- ['@constructor'] = { fg = colors.cyan, },

		-- ['@conditional'] = { fg = colors.pink, },
		-- ['@repeat'] = { fg = colors.pink, },
		-- ['@label'] = { fg = colors.cyan, },

		-- ['@keyword'] = { fg = colors.pink, },
		-- ['@keyword.function'] = { fg = colors.cyan, },
		-- ['@keyword.operator'] = { fg = colors.pink, },
		-- ['@operator'] = { fg = colors.pink, },
		-- ['@exception'] = { fg = colors.purple, },
		-- ['@type'] = { fg = colors.bright_cyan, },
		-- ['@type.builtin'] = { fg = colors.cyan, italic = true, },
		-- ['@type.qualifier'] = { fg = colors.pink, },
		-- ['@structure'] = { fg = colors.purple, },
		-- ['@include'] = { fg = colors.pink, },

		-- ['@variable'] = { fg = colors.fg, },
		-- ['@variable.builtin'] = { fg = colors.purple, },

		-- ['@text'] = { fg = colors.orange, },
		-- ['@text.strong'] = { fg = colors.orange, bold = true, }, -- bold
		-- ['@text.emphasis'] = { fg = colors.yellow, italic = true, }, -- italic
		-- ['@text.underline'] = { fg = colors.orange, },
		-- ['@text.title'] = { fg = colors.pink, bold = true, }, -- title
		-- ['@text.literal'] = { fg = colors.yellow, }, -- inline code
		-- ['@text.uri'] = { fg = colors.yellow, italic = true, }, -- urls
		-- ['@text.reference'] = { fg = colors.orange, bold = true, },

		-- ['@tag'] = { fg = colors.cyan, },
		-- ['@tag.attribute'] = { fg = colors.green, },
		-- ['@tag.delimiter'] = { fg = colors.cyan, },

		-- Semantic
		-- ['@class'] = { fg = colors.cyan },
		-- ['@struct'] = { fg = colors.cyan },
		-- ['@enum'] = { fg = colors.cyan },
		-- ['@enumMember'] = { fg = colors.purple },
		-- ['@event'] = { fg = colors.cyan },
		-- ['@interface'] = { fg = colors.cyan },
		-- ['@modifier'] = { fg = colors.cyan },
		-- ['@regexp'] = { fg = colors.yellow },
		-- ['@typeParameter'] = { fg = colors.cyan },
		-- ['@decorator'] = { fg = colors.cyan },

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
		htmlLink = { fg = colors.cyan, underline = true, },
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
		markdownH2 = { fg = colors.purple, bold = true, },
		markdownH3 = { fg = colors.purple, bold = true, },
		markdownH4 = { fg = colors.purple, bold = true, },
		markdownH5 = { fg = colors.purple, bold = true, },
		markdownH6 = { fg = colors.purple, bold = true, },
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

		-- debugPc = { bg = colors.cyan, },
		-- debugBreakpoint = { fg = colors.red, reverse = true, },

		-- Git Signs
		GitSignsAdd = { fg = colors.green_alt, },
		GitSignsChange = { fg = colors.cyan, },
		GitSignsDelete = { fg = colors.red_alt, },
		GitSignsAddLn = { fg = colors.bg, bg = colors.green_alt, },
		GitSignsChangeLn = { fg = colors.bg, bg = colors.cyan, },
		GitSignsDeleteLn = { fg = colors.bg, bg = colors.red_alt, },
		GitSignsCurrentLineBlame = { fg = colors.fg, },

		-- LSP
		-- DiagnosticError = { fg = colors.red, },
		-- DiagnosticWarn = { fg = colors.yellow, },
		-- DiagnosticInfo = { fg = colors.cyan, },
		-- DiagnosticHint = { fg = colors.cyan, },
		-- DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
		-- DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
		-- DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
		-- DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
		-- DiagnosticSignError = { fg = colors.red, },
		-- DiagnosticSignWarn = { fg = colors.yellow, },
		-- DiagnosticSignInfo = { fg = colors.cyan, },
		-- DiagnosticSignHint = { fg = colors.cyan, },
		-- DiagnosticFloatingError = { fg = colors.red, },
		-- DiagnosticFloatingWarn = { fg = colors.yellow, },
		-- DiagnosticFloatingInfo = { fg = colors.cyan, },
		-- DiagnosticFloatingHint = { fg = colors.cyan, },
		-- DiagnosticVirtualTextError = { fg = colors.red, },
		-- DiagnosticVirtualTextWarn = { fg = colors.yellow, },
		-- DiagnosticVirtualTextInfo = { fg = colors.cyan, },
		-- DiagnosticVirtualTextHint = { fg = colors.cyan, },

		-- LspDiagnosticsDefaultError = { fg = colors.red, },
		-- LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
		-- LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
		-- LspDiagnosticsDefaultHint = { fg = colors.cyan, },
		-- LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
		-- LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
		-- LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
		-- LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
		-- LspReferenceText = { fg = colors.orange, },
		-- LspReferenceRead = { fg = colors.orange, },
		-- LspReferenceWrite = { fg = colors.orange, },
		-- LspCodeLens = { fg = colors.cyan, },

		--LSP Saga
		-- LspFloatWinNormal = { fg = colors.fg, },
		-- LspFloatWinBorder = { fg = colors.comment, },
		-- LspSagaHoverBorder = { fg = colors.comment, },
		-- LspSagaSignatureHelpBorder = { fg = colors.comment, },
		-- LspSagaCodeActionBorder = { fg = colors.comment, },
		-- LspSagaDefPreviewBorder = { fg = colors.comment, },
		-- LspLinesDiagBorder = { fg = colors.comment, },
		-- LspSagaRenameBorder = { fg = colors.comment, },
		-- LspSagaBorderTitle = { fg = colors.menu, },
		-- LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
		-- LspSagaDiagnosticBorder = { fg = colors.comment, },
		-- LspSagaShTruncateLine = { fg = colors.comment, },
		-- LspSagaDocTruncateLine = { fg = colors.comment, },
		-- LspSagaLspFinderBorder = { fg = colors.comment, },

		-- Cmp
		CmpItemKind = { link = "Pmenu" },
		CmpItemAbbr = { link = "Pmenu" },
		CmpItemKindMethod = { link = "@method" },
		CmpItemKindText = { link = "@text" },
		CmpItemKindFunction = { link = "@function" },
		CmpItemKindConstructor = { link = "@type" },
		CmpItemKindVariable = { link = "@variable" },
		CmpItemKindClass = { link = "@type" },
		CmpItemKindInterface = { link = "@type" },
		CmpItemKindModule = { link = "@namespace" },
		CmpItemKindProperty = { link = "@property" },
		CmpItemKindOperator = { link = "@operator" },
		CmpItemKindReference = { link = "@parameter.reference" },
		CmpItemKindUnit = { link = "@field" },
		CmpItemKindValue = { link = "@field" },
		CmpItemKindField = { link = "@field" },
		CmpItemKindEnum = { link = "@field" },
		CmpItemKindKeyword = { link = "@keyword" },
		CmpItemKindSnippet = { link = "@text" },
		CmpItemKindColor = { link = "DevIconCss" },
		CmpItemKindFile = { link = "TSURI" },
		CmpItemKindFolder = { link = "TSURI" },
		CmpItemKindEvent = { link = "@constant" },
		CmpItemKindEnumMember = { link = "@field" },
		CmpItemKindConstant = { link = "@constant" },
		CmpItemKindStruct = { link = "@structure" },
		CmpItemKindTypeParameter = { link = "@parameter" },

		-- TS rainbow colors
		rainbowcol1 = { fg = colors.red, },
		rainbowcol2 = { fg = colors.green, },
		rainbowcol3 = { fg = colors.yellow, },
		rainbowcol4 = { fg = colors.purple, },
		rainbowcol5 = { fg = colors.pink, },
		rainbowcol6 = { fg = colors.cyan, },
		rainbowcol7 = { fg = colors.fg, },
	}
end

return {
	setup = setup,
}
