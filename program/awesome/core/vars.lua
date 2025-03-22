local mods = require("core.mods")

local M = {
	-- theme_path {{{
	theme_path = function(name)
		local path = "<HOME>/.config/awesome/themes/<name>/"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
	end,
	-- }}}
	-- theme_conf {{{
	theme_conf = function(name)
		local path = "<HOME>/.config/awesome/themes/<name>/theme.lua"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
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
		mods.awful.spawn.with_shell("feh --bg-scale ~/.config/awesome/themes/custom/awesome-wall.png")
		mods.awful.spawn("picom")
		mods.awful.spawn("alacritty -e tmux")
	end,
}

return M
