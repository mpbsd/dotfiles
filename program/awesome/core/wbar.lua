local mods = require("core.mods")
local vars = require("core.vars")
-- local menu = require("core.menu")

local set_wallpaper = function(s)
	-- Wallpaper
	if mods.beautiful.wallpaper then
		local wallpaper = mods.beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		mods.gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

mods.awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	mods.awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, mods.awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = mods.awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = mods.awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(mods.gears.table.join(
		mods.awful.button({}, 1, function()
			mods.awful.layout.inc(1)
		end),
		mods.awful.button({}, 3, function()
			mods.awful.layout.inc(-1)
		end),
		mods.awful.button({}, 4, function()
			mods.awful.layout.inc(1)
		end),
		mods.awful.button({}, 5, function()
			mods.awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = mods.awful.widget.taglist({
		screen = s,
		filter = mods.awful.widget.taglist.filter.all,
		buttons = mods.gears.table.join(
			mods.awful.button({}, 1, function(t)
				t:view_only()
			end),
			mods.awful.button({ vars.modkey }, 1, function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end),
			mods.awful.button({}, 3, mods.awful.tag.viewtoggle),
			mods.awful.button({ vars.modkey }, 3, function(t)
				if client.focus then
					client.focus:toggle_tag(t)
				end
			end),
			mods.awful.button({}, 4, function(t)
				mods.awful.tag.viewnext(t.screen)
			end),
			mods.awful.button({}, 5, function(t)
				mods.awful.tag.viewprev(t.screen)
			end)
		),
	})

	-- Create a tasklist widget
	s.mytasklist = mods.awful.widget.tasklist({
		screen = s,
		filter = mods.awful.widget.tasklist.filter.currenttags,
		buttons = mods.gears.table.join(
			mods.awful.button({}, 1, function(c)
				if c == client.focus then
					c.minimized = true
				else
					c:emit_signal("request::activate", "tasklist", { raise = true })
				end
			end),
			mods.awful.button({}, 3, function()
				mods.awful.menu.client_list({ theme = { width = 250 } })
			end),
			mods.awful.button({}, 4, function()
				mods.awful.client.focus.byidx(1)
			end),
			mods.awful.button({}, 5, function()
				mods.awful.client.focus.byidx(-1)
			end)
		),
	})

	-- Create the mods.wibox
	s.mywibox = mods.awful.wibar({ position = "top", screen = s })

	-- CPU widget
	-- local cpuicon = mods.wibox.widget({
	-- 	image = "/usr/share/icons/oxygen/base/22x22/devices/cpu.png",
	-- 	resize = false,
	-- 	widget = mods.wibox.widget.imagebox,
	-- })
	-- local cpuwidget = mods.wibox.widget.graph()
	-- cpuwidget:set_width(20)
	-- cpuwidget:set_color(mods.gears.color.create_solid_pattern("#111111"))
	-- mods.vicious.cache(mods.vicious.widgets.cpu)
	-- cpuwidget.opacity = "1"
	-- mods.vicious.register(cpuwidget, mods.vicious.widgets.cpu, "$1", 5)
	-- mods.beautiful.graph_bg = "#11111111"

	-- MEM widget
	-- local memwidget = mods.wibox.widget.graph()
	-- memwidget:set_width(20)
	-- memwidget:set_color(mods.gears.color.create_solid_pattern("#ffffff"))
	-- mods.vicious.cache(mods.vicious.widgets.mem)
	-- memwidget.opacity = "1"
	-- mods.vicious.register(memwidget, mods.vicious.widgets.mem, "$1", 5)
	-- mods.beautiful.graph_bg = "#11111111"

	-- Add widgets to the mods.wibox
	s.mywibox:setup({
		layout = mods.wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = mods.wibox.layout.fixed.horizontal,
			-- vars.menu(menu)["mylauncher"],
			s.mytaglist,
			s.mylayoutbox,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = mods.wibox.layout.fixed.horizontal,
			mods.awful.widget.keyboardlayout(),
			-- cpuwidget,
			-- memwidget,
			mods.wibox.widget.textclock(),
			-- s.mylayoutbox,
		},
	})
end)
