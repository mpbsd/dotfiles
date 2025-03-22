-- Standard awesome library
local mods = require("core.mods")
local vars = require("core.vars")
local menu = require("core.menu")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Error handling
require("core.flaw")

-- look define colours, icons, font and wallpapers.
local chosen_theme = {
	"custom",
}
mods.beautiful.init(vars.theme_conf(chosen_theme[1]))

-- Table of layouts
mods.awful.layout.layouts = vars.layouts

-- {{{ Menu
-- Create a launcher widget and a main menu
local mymainmenu = vars.menu(menu)["mymainmenu"]
local mylauncher = vars.menu(menu)["mylauncher"]

-- mods.Menubar configuration
-- Set the terminal for applications that require it
mods.menubar.utils.terminal = vars.terminal
-- }}}

-- Keyboard map indicator and switcher
local mykeyboardlayout = mods.awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = mods.wibox.widget.textclock()

-- Create a mods.wibox for each screen and add it
local taglist_buttons = mods.gears.table.join(
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
)

local tasklist_buttons = mods.gears.table.join(
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
)

local function set_wallpaper(s)
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
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = mods.awful.widget.tasklist({
		screen = s,
		filter = mods.awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Create the mods.wibox
	s.mywibox = mods.awful.wibar({ position = "top", screen = s })

	-- Add widgets to the mods.wibox
	s.mywibox:setup({
		layout = mods.wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = mods.wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = mods.wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			mods.wibox.widget.systray(),
			mytextclock,
			s.mylayoutbox,
		},
	})
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(mods.gears.table.join(
	mods.awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	mods.awful.button({}, 4, mods.awful.tag.viewnext),
	mods.awful.button({}, 5, mods.awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
local globalkeys = mods.gears.table.join(
	mods.awful.key(
		{
			vars.modkey,
		},
		"s",
		mods.hotkeys_popup.show_help,
		{
			description = "show help",
			group = "awesome",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"Left",
		mods.awful.tag.viewprev,
		{
			description = "view previous",
			group = "tag",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"Right",
		mods.awful.tag.viewnext,
		{
			description = "view next",
			group = "tag",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"Escape",
		mods.awful.tag.history.restore,
		{
			description = "go back",
			group = "tag",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"j",
		function()
			mods.awful.client.focus.byidx(1)
		end,
		{
			description = "focus next by index",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"k",
		function()
			mods.awful.client.focus.byidx(-1)
		end,
		{
			description = "focus previous by index",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"w",
		function()
			mymainmenu:show()
		end,
		{
			description = "show main menu",
			group = "awesome",
		}
	),
	-- Layout manipulation
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"j",
		function()
			mods.awful.client.swap.byidx(1)
		end,
		{
			description = "swap with next client by index",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"k",
		function()
			mods.awful.client.swap.byidx(-1)
		end,
		{
			description = "swap with previous client by index",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"j",
		function()
			mods.awful.screen.focus_relative(1)
		end,
		{
			description = "focus the next screen",
			group = "screen",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"k",
		function()
			mods.awful.screen.focus_relative(-1)
		end,
		{
			description = "focus the previous screen",
			group = "screen",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"u",
		mods.awful.client.urgent.jumpto,
		{
			description = "jump to urgent client",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"Tab",
		function()
			mods.awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{
			description = "go back",
			group = "client",
		}
	),
	-- Standard program
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"Return",
		function()
			mods.awful.spawn(vars.terminal)
		end,
		{
			description = "open a terminal",
			group = "launcher",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"r",
		awesome.restart,
		{
			description = "reload awesome",
			group = "awesome",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"q",
		awesome.quit,
		{
			description = "quit awesome",
			group = "awesome",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"l",
		function()
			mods.awful.tag.incmwfact(0.05)
		end,
		{
			description = "increase master width factor",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"h",
		function()
			mods.awful.tag.incmwfact(-0.05)
		end,
		{
			description = "decrease master width factor",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"h",
		function()
			mods.awful.tag.incnmaster(1, nil, true)
		end,
		{
			description = "increase the number of master clients",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"l",
		function()
			mods.awful.tag.incnmaster(-1, nil, true)
		end,
		{
			description = "decrease the number of master clients",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"h",
		function()
			mods.awful.tag.incncol(1, nil, true)
		end,
		{
			description = "increase the number of columns",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"l",
		function()
			mods.awful.tag.incncol(-1, nil, true)
		end,
		{
			description = "decrease the number of columns",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"space",
		function()
			mods.awful.layout.inc(1)
		end,
		{
			description = "select next",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"space",
		function()
			mods.awful.layout.inc(-1)
		end,
		{
			description = "select previous",
			group = "layout",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"n",
		function()
			local c = mods.awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end,
		{
			description = "restore minimized",
			group = "client",
		}
	),
	-- Prompt
	mods.awful.key(
		{
			vars.modkey,
		},
		"r",
		function()
			mods.awful.screen.focused().mypromptbox:run()
		end,
		{
			description = "run prompt",
			group = "launcher",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"x",
		function()
			mods.awful.prompt.run({
				prompt = "Run Lua code: ",
				textbox = mods.awful.screen.focused().mypromptbox.widget,
				exe_callback = mods.awful.util.eval,
				history_path = mods.awful.util.get_cache_dir() .. "/history_eval",
			})
		end,
		{
			description = "lua execute prompt",
			group = "awesome",
		}
	),
	-- mods.Menubar
	mods.awful.key(
		{
			vars.modkey,
		},
		"p",
		function()
			mods.awful.spawn("dmenu_run")
		end,
		{
			description = "show the mods.menubar",
			group = "launcher",
		}
	)
)

local clientkeys = mods.gears.table.join(
	mods.awful.key(
		{
			vars.modkey,
		},
		"f",
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{
			description = "toggle fullscreen",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"c",
		function(c)
			c:kill()
		end,
		{
			description = "close",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"space",
		mods.awful.client.floating.toggle,
		{
			description = "toggle floating",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"Return",
		function(c)
			c:swap(mods.awful.client.getmaster())
		end,
		{
			description = "move to master",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"o",
		function(c)
			c:move_to_screen()
		end,
		{
			description = "move to screen",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"t",
		function(c)
			c.ontop = not c.ontop
		end,
		{
			description = "toggle keep on top",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"n",
		function(c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end,
		{
			description = "minimize",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
		},
		"m",
		function(c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{
			description = "(un)maximize",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"m",
		function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end,
		{
			description = "(un)maximize vertically",
			group = "client",
		}
	),
	mods.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"m",
		function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end,
		{
			description = "(un)maximize horizontally",
			group = "client",
		}
	)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = mods.gears.table.join(
		globalkeys,
		-- View tag only.
		mods.awful.key(
			{
				vars.modkey,
			},
			"#" .. i + 9,
			function()
				local screen = mods.awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{
				description = "view tag #" .. i,
				group = "tag",
			}
		),
		-- Toggle tag display.
		mods.awful.key(
			{
				vars.modkey,
				"Control",
			},
			"#" .. i + 9,
			function()
				local screen = mods.awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					mods.awful.tag.viewtoggle(tag)
				end
			end,
			{
				description = "toggle tag #" .. i,
				group = "tag",
			}
		),
		-- Move client to tag.
		mods.awful.key(
			{
				vars.modkey,
				"Shift",
			},
			"#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{
				description = "move focused client to tag #" .. i,
				group = "tag",
			}
		),
		-- Toggle tag on focused client.
		mods.awful.key(
			{
				vars.modkey,
				"Control",
				"Shift",
			},
			"#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{
				description = "toggle focused client on tag #" .. i,
				group = "tag",
			}
		)
	)
end

local clientbuttons = mods.gears.table.join(
	mods.awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	mods.awful.button({ vars.modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		mods.awful.mouse.client.move(c)
	end),
	mods.awful.button({ vars.modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		mods.awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- Rules {{{
-- Rules to apply to new clients (through the "manage" signal).
mods.awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = mods.beautiful.border_width,
			border_color = mods.beautiful.border_normal,
			focus = mods.awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = mods.awful.screen.preferred,
			placement = mods.awful.placement.no_overlap + mods.awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = {
			floating = true,
		},
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = {
			type = {
				"normal",
				"dialog",
			},
		},
		properties = {
			titlebars_enabled = false,
		},
	},

	-- Set st to always map on the tag named "2" on screen 1.
	{
		rule = {
			class = "st",
		},
		properties = {
			screen = 1,
			tag = "1",
		},
	},
	-- Set Chromium to always map on the tag named "2" on screen 1.
	{
		rule = {
			class = "Chromium",
		},
		properties = {
			screen = 1,
			tag = "2",
		},
	},
	-- Set Firefox to always map on the tag named "2" on screen 1.
	{
		rule = {
			class = "firefox-esr",
		},
		properties = {
			screen = 1,
			tag = "2",
		},
	},
}
-- }}}

-- Signals
require("core.sign")

vars.run_at_startup()

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
