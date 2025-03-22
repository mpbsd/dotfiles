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
		local m = mods.awful.menu(menu)
		local M = {
			mymainmenu = m,
			mylauncher = mods.awful.widget.launcher({
				image = mods.beautiful.awesome_icon,
				menu = m,
			}),
		}
		return M
	end,
	-- }}}
	modkey = "Mod1",
	terminal = "st",
	editor = "vi",
	editor_cmd = "st -e vi",
	-- layouts {{{
	layouts = {
		mods.awful.layout.suit.tile,
		mods.awful.layout.suit.max,
	},
	-- }}}
	-- cmds to run at startup {{{
	run_at_startup = function()
		mods.awful.spawn.with_shell("feh --bg-scale ~/.config/awesome/look/custom/wall.png")
		mods.awful.spawn("picom")
		mods.awful.spawn("st -e tmux")
	end,
	-- }}}
}

return M
