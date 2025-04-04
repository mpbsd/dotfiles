local mods = require("core.mods")
local vars = require("core.vars")
local keys = require("core.keys")
local look = {
	"custom",
	"solarized",
}

require("awful.autofocus")

require("awful.hotkeys_popup.keys")

require("core.flaw")

mods.beautiful.init(vars.theme_conf(look[2]))

mods.awful.layout.layouts = vars.layouts

mods.menubar.utils.terminal = vars.terminal

require("core.wbar")

require("core.mkey")

vars.set_keys(keys["globalkeys"])

require("core.rule")

require("core.sign")

vars.run_at_startup()

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
