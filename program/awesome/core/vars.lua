local mods = require("core.mods")
local mkey = "Mod1"
local term = "st"
local edit = "vi"

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
	modkey = mkey,
	terminal = term,
	editor = edit,
	editor_cmd = term .. " -e " .. edit,
	-- layouts {{{
	layouts = {
		mods.awful.layout.suit.tile,
		mods.awful.layout.suit.max,
	},
	-- }}}
	-- cmds to run at startup {{{
	run_at_startup = function()
    local wall = "feh --bg-scale ~/.config/awesome/look/custom/wall.png"
		mods.awful.spawn.with_shell(wall)
		mods.awful.spawn("picom")
		mods.awful.spawn("st -e tmux")
	end,
	-- }}}
}

return M
