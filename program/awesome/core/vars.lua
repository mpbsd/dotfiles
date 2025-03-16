local libs = require("core.libs")

local M = {
	theme_path = function(name)
		local path = "<HOME>/.config/awesome/themes/<name>/"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
	end,
	theme_conf = function(name)
		local path = "<HOME>/.config/awesome/themes/<name>/theme.lua"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
	end,
	modkey = "Mod1",
	terminal = "st -e tmux",
	editor = os.getenv("EDITOR") or "vi",
	layouts = {
		libs.awful.layout.suit.tile,
		libs.awful.layout.suit.floating,
		libs.awful.layout.suit.max,
	},
}

return M
