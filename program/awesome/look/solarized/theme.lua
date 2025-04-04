--[[
  An Awesome WM theme based on the zenburn theme
  By Marcelo Barboza
--]]

local vars = require("core.vars")

local themes_path = vars.theme_path("solarized")
local dpi = require("beautiful.xresources").apply_dpi

local color = {
	base3 = "#002b36ff",
	base2 = "#073642ff",
	base1 = "#586e75ff",
	base0 = "#657b83ff",
	base00 = "#839496ff",
	base01 = "#93a1a1ff",
	base02 = "#eee8d5ff",
	base03 = "#fdf6e3ff",
	yellow = "#b58900ff",
	orange = "#cb4b16ff",
	red = "#dc322fff",
	magenta = "#d33682ff",
	violet = "#6c71c4ff",
	blue = "#268bd2ff",
	cyan = "#2aa198ff",
	green = "#859900ff",
}

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "wall.png"
-- }}}

-- {{{ Styles
theme.font = "Terminess Nerd Font Mono 9"

-- {{{ Colors
theme.fg_normal = color.base01
theme.fg_focus = color.base03
theme.fg_urgent = color.base3
theme.bg_normal = color.base3
theme.bg_focus = color.base1
theme.bg_urgent = color.red
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap = dpi(6)
theme.border_width = dpi(2)
theme.border_normal = color.base2
theme.border_focus = color.green
theme.border_marked = color.red
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus = color.base1
theme.titlebar_bg_normal = color.base2
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- }}}

-- {{{ Menu
theme.menu_height = dpi(20)
theme.menu_width = dpi(120)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel = themes_path .. "taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "taglist/squarez.png"
-- }}}

-- {{{ Misc
theme.awesome_icon = themes_path .. "icon.png"
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile = themes_path .. "layouts/tile.png"
theme.layout_floating = themes_path .. "layouts/floating.png"
theme.layout_max = themes_path .. "layouts/max.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus = themes_path .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active = themes_path .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active = themes_path .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active = themes_path .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active = themes_path .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

theme.tasklist_disable_icon = true

return theme

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
