-- Standard awesome library
local libs = require("core.libs")
local vars = require("core.vars")
local menu = require("core.menu")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Error handling
require("core.fail")

-- Themes define colours, icons, font and wallpapers.
local chosen_theme = {
	"custom",
}
libs.beautiful.init(vars.theme_conf(chosen_theme[1]))

-- Table of layouts
libs.awful.layout.layouts = vars.layouts

-- {{{ Menu
-- Create a launcher widget and a main menu
local mymainmenu = libs.awful.menu(menu)
local mylauncher = libs.awful.widget.launcher({
	image = libs.beautiful.awesome_icon,
	menu = mymainmenu,
})

-- libs.Menubar configuration
-- Set the terminal for applications that require it
libs.menubar.utils.terminal = vars.terminal
-- }}}

-- Keyboard map indicator and switcher
local mykeyboardlayout = libs.awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = libs.wibox.widget.textclock()

-- Create a libs.wibox for each screen and add it
local taglist_buttons = libs.gears.table.join(
	libs.awful.button({}, 1, function(t)
		t:view_only()
	end),
	libs.awful.button({ vars.modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	libs.awful.button({}, 3, libs.awful.tag.viewtoggle),
	libs.awful.button({ vars.modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	libs.awful.button({}, 4, function(t)
		libs.awful.tag.viewnext(t.screen)
	end),
	libs.awful.button({}, 5, function(t)
		libs.awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = libs.gears.table.join(
	libs.awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	libs.awful.button({}, 3, function()
		libs.awful.menu.client_list({ theme = { width = 250 } })
	end),
	libs.awful.button({}, 4, function()
		libs.awful.client.focus.byidx(1)
	end),
	libs.awful.button({}, 5, function()
		libs.awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if libs.beautiful.wallpaper then
		local wallpaper = libs.beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		libs.gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

libs.awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	libs.awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, libs.awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = libs.awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = libs.awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(libs.gears.table.join(
		libs.awful.button({}, 1, function()
			libs.awful.layout.inc(1)
		end),
		libs.awful.button({}, 3, function()
			libs.awful.layout.inc(-1)
		end),
		libs.awful.button({}, 4, function()
			libs.awful.layout.inc(1)
		end),
		libs.awful.button({}, 5, function()
			libs.awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = libs.awful.widget.taglist({
		screen = s,
		filter = libs.awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = libs.awful.widget.tasklist({
		screen = s,
		filter = libs.awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Create the libs.wibox
	s.mywibox = libs.awful.wibar({ position = "top", screen = s })

	-- Add widgets to the libs.wibox
	s.mywibox:setup({
		layout = libs.wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = libs.wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = libs.wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			libs.wibox.widget.systray(),
			mytextclock,
			s.mylayoutbox,
		},
	})
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(libs.gears.table.join(
	libs.awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	libs.awful.button({}, 4, libs.awful.tag.viewnext),
	libs.awful.button({}, 5, libs.awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
local globalkeys = libs.gears.table.join(
	libs.awful.key(
		{
			vars.modkey,
		},
		"s",
		libs.hotkeys_popup.show_help,
		{
			description = "show help",
			group = "awesome",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"Left",
		libs.awful.tag.viewprev,
		{
			description = "view previous",
			group = "tag",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"Right",
		libs.awful.tag.viewnext,
		{
			description = "view next",
			group = "tag",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"Escape",
		libs.awful.tag.history.restore,
		{
			description = "go back",
			group = "tag",
		}
	),

	libs.awful.key(
		{
			vars.modkey,
		},
		"j",
		function()
			libs.awful.client.focus.byidx(1)
		end,
		{
			description = "focus next by index",
			group = "client",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"k",
		function()
			libs.awful.client.focus.byidx(-1)
		end,
		{
			description = "focus previous by index",
			group = "client",
		}
	),
	libs.awful.key(
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
	libs.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"j",
		function()
			libs.awful.client.swap.byidx(1)
		end,
		{
			description = "swap with next client by index",
			group = "client",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"k",
		function()
			libs.awful.client.swap.byidx(-1)
		end,
		{
			description = "swap with previous client by index",
			group = "client",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"j",
		function()
			libs.awful.screen.focus_relative(1)
		end,
		{
			description = "focus the next screen",
			group = "screen",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"k",
		function()
			libs.awful.screen.focus_relative(-1)
		end,
		{
			description = "focus the previous screen",
			group = "screen",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"u",
		libs.awful.client.urgent.jumpto,
		{
			description = "jump to urgent client",
			group = "client",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"Tab",
		function()
			libs.awful.client.focus.history.previous()
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
	libs.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"Return",
		function()
			libs.awful.spawn(vars.terminal)
		end,
		{
			description = "open a terminal",
			group = "launcher",
		}
	),
	libs.awful.key(
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
	libs.awful.key(
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

	libs.awful.key(
		{
			vars.modkey,
		},
		"l",
		function()
			libs.awful.tag.incmwfact(0.05)
		end,
		{
			description = "increase master width factor",
			group = "layout",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"h",
		function()
			libs.awful.tag.incmwfact(-0.05)
		end,
		{
			description = "decrease master width factor",
			group = "layout",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"h",
		function()
			libs.awful.tag.incnmaster(1, nil, true)
		end,
		{
			description = "increase the number of master clients",
			group = "layout",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"l",
		function()
			libs.awful.tag.incnmaster(-1, nil, true)
		end,
		{
			description = "decrease the number of master clients",
			group = "layout",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"h",
		function()
			libs.awful.tag.incncol(1, nil, true)
		end,
		{
			description = "increase the number of columns",
			group = "layout",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"l",
		function()
			libs.awful.tag.incncol(-1, nil, true)
		end,
		{
			description = "decrease the number of columns",
			group = "layout",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
		},
		"space",
		function()
			libs.awful.layout.inc(1)
		end,
		{
			description = "select next",
			group = "layout",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Shift",
		},
		"space",
		function()
			libs.awful.layout.inc(-1)
		end,
		{
			description = "select previous",
			group = "layout",
		}
	),

	libs.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"n",
		function()
			local c = libs.awful.client.restore()
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
	libs.awful.key(
		{
			vars.modkey,
		},
		"r",
		function()
			libs.awful.screen.focused().mypromptbox:run()
		end,
		{
			description = "run prompt",
			group = "launcher",
		}
	),

	libs.awful.key(
		{
			vars.modkey,
		},
		"x",
		function()
			libs.awful.prompt.run({
				prompt = "Run Lua code: ",
				textbox = libs.awful.screen.focused().mypromptbox.widget,
				exe_callback = libs.awful.util.eval,
				history_path = libs.awful.util.get_cache_dir() .. "/history_eval",
			})
		end,
		{
			description = "lua execute prompt",
			group = "awesome",
		}
	),
	-- libs.Menubar
	libs.awful.key(
		{
			vars.modkey,
		},
		"p",
		function()
			libs.awful.spawn("dmenu_run")
		end,
		{
			description = "show the libs.menubar",
			group = "launcher",
		}
	)
)

local clientkeys = libs.gears.table.join(
	libs.awful.key(
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
	libs.awful.key(
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
	libs.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"space",
		libs.awful.client.floating.toggle,
		{
			description = "toggle floating",
			group = "client",
		}
	),
	libs.awful.key(
		{
			vars.modkey,
			"Control",
		},
		"Return",
		function(c)
			c:swap(libs.awful.client.getmaster())
		end,
		{
			description = "move to master",
			group = "client",
		}
	),
	libs.awful.key(
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
	libs.awful.key(
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
	libs.awful.key(
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
	libs.awful.key(
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
	libs.awful.key(
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
	libs.awful.key(
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
	globalkeys = libs.gears.table.join(
		globalkeys,
		-- View tag only.
		libs.awful.key(
			{
				vars.modkey,
			},
			"#" .. i + 9,
			function()
				local screen = libs.awful.screen.focused()
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
		libs.awful.key(
			{
				vars.modkey,
				"Control",
			},
			"#" .. i + 9,
			function()
				local screen = libs.awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					libs.awful.tag.viewtoggle(tag)
				end
			end,
			{
				description = "toggle tag #" .. i,
				group = "tag",
			}
		),
		-- Move client to tag.
		libs.awful.key(
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
		libs.awful.key(
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

local clientbuttons = libs.gears.table.join(
	libs.awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	libs.awful.button({ vars.modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		libs.awful.mouse.client.move(c)
	end),
	libs.awful.button({ vars.modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		libs.awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
libs.awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = libs.beautiful.border_width,
			border_color = libs.beautiful.border_normal,
			focus = libs.awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = libs.awful.screen.preferred,
			placement = libs.awful.placement.no_overlap + libs.awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
				"gcr-prompter",
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
				"Gcr-prompter",
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

	-- Set Firefox to always map on the tag named "2" on screen 1.
	{
		rule = {
			class = "Firefox",
		},
		properties = {
			screen = 1,
			tag = "2",
		},
	},
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then libs.awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		libs.awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = libs.gears.table.join(
		libs.awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			libs.awful.mouse.client.move(c)
		end),
		libs.awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			libs.awful.mouse.client.resize(c)
		end)
	)

	libs.awful.titlebar(c):setup({
		{ -- Left
			libs.awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = libs.wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = libs.awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = libs.wibox.layout.flex.horizontal,
		},
		{ -- Right
			libs.awful.titlebar.widget.floatingbutton(c),
			libs.awful.titlebar.widget.maximizedbutton(c),
			libs.awful.titlebar.widget.stickybutton(c),
			libs.awful.titlebar.widget.ontopbutton(c),
			libs.awful.titlebar.widget.closebutton(c),
			layout = libs.wibox.layout.fixed.horizontal(),
		},
		layout = libs.wibox.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = libs.beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = libs.beautiful.border_normal
end)
-- }}}

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
