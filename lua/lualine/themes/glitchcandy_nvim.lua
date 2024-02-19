local colors = require("glitchcandy_nvim").colors()

local bg = colors.bg_alt

local normal = {
   a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
   b = { fg = colors.purple, bg = bg },
   c = { fg = colors.fg, bg = bg },
}

local command = {
   a = { fg = colors.fb, bg = colors.cyan, gui = 'bold' },
   b = { fg = colors.cyan, bg = bg },
}

local visual = {
   a = { fg = colors.bg, bg = colors.pink, gui = 'bold' },
   b = { fg = colors.pink, bg = bg },
}

local inactive = {
   a = { fg = colors.fg, bg = colors.orange, gui = 'bold' },
   b = { fg = colors.bg, bg = colors.fg },
}

local replace = {
   a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
   b = { fg = colors.yellow, bg = bg },
   c = { fg = colors.fg, bg = bg },
}

local insert = {
   a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
   b = { fg = colors.green, bg = bg },
   c = { fg = colors.fg, bg = bg },
}

return {
   normal = normal,
   command = command,
   visual = visual,
   inactive = inactive,
   replace = replace,
   insert = insert,
}
