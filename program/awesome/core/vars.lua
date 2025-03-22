local mods = require("core.mods")

local M = {
	-- theme_path {{{
	theme_path = function(name)
		local path = "<HOME>/.config/awesome/look/<name>/"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
	end,
	-- }}}
	-- theme_conf {{{
	theme_conf = function(name)
		local path = "<HOME>/.config/awesome/look/<name>/theme.lua"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
	end,
	-- }}}
	-- menu {{{
	menu = function(menu)
		local H = {
			mymainmenu = mods.awful.menu(menu),
			mylauncher = mods.awful.widget.launcher({
				image = mods.beautiful.awesome_icon,
				menu = mods.awful.menu(menu),
			}),
		}
		return H
	end,
	-- }}}
	modkey = "Mod1",
	terminal = "alacritty",
	editor = "vi",
	editor_cmd = "alacritty -e vi",
	layouts = {
		mods.awful.layout.suit.tile,
		mods.awful.layout.suit.max,
		mods.awful.layout.suit.floating,
	},
	run_at_startup = function()
		mods.awful.spawn.with_shell("feh --bg-scale ~/.config/awesome/look/custom/wall.png")
		mods.awful.spawn("picom")
		mods.awful.spawn("alacritty -e tmux")
	end,
}

return M
