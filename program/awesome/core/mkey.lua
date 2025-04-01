local mods = require("core.mods")
local vars = require("core.vars")
local menu = require("core.menu")

local mymainmenu = vars.menu(menu)["mymainmenu"]

root.buttons(mods.gears.table.join(
	mods.awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	mods.awful.button({}, 4, mods.awful.tag.viewnext),
	mods.awful.button({}, 5, mods.awful.tag.viewprev)
))
