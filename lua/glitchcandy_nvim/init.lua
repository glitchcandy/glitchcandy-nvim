local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl

local function apply_term_colors(colors)
   g.terminal_color_0 = colors.bg
   g.terminal_color_1 = colors.red
   g.terminal_color_2 = colors.green
   g.terminal_color_3 = colors.yellow
   g.terminal_color_4 = colors.purple
   g.terminal_color_5 = colors.pink
   g.terminal_color_6 = colors.cyan
   g.terminal_color_7 = colors.fg
   g.terminal_color_8 = colors.fg_alt
   g.terminal_color_9 = colors.red_alt
   g.terminal_color_10 = colors.green_alt
   g.terminal_color_11 = colors.yellow_alt
   g.terminal_color_12 = colors.blue_alt
   g.terminal_color_13 = colors.purple_alt
   g.terminal_color_14 = colors.cyan_alt
   g.terminal_color_15 = colors.white_alt
   g.terminal_color_background = colors.bg
   g.terminal_color_foreground = colors.fg
end

---apply colorscheme
local function apply()
   local colors = require("glitchcandy_nvim.palette")
   apply_term_colors(colors)
   local groups = require("glitchcandy_nvim.groups").setup()

   -- set defined highlights
   for group, setting in pairs(groups) do
      nvim_set_hl(0, group, setting)
   end
end

---load colorscheme
local function load()
   if vim.version().minor < 9 then
      vim.notify_once("glitchcandy_nvim: you must use neovim 0.9 or higher")
      return
   end

   -- reset colors
   if g.colors_name then
      cmd("hi clear")
   end

   if vim.fn.exists("syntax_on") then
      cmd("syntax reset")
   end

   o.background = "dark"
   o.termguicolors = true
   g.colors_name = "glitchcandy_nvim"

   apply()
end

return {
   load = load,
   colors = require("glitchcandy_nvim.palette").colors,
}
