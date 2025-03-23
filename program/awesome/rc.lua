-- Standard awesome library
local mods = require("core.mods")
local vars = require("core.vars")
local menu = require("core.menu")
local keys = require("core.keys")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- flaw {{{
require("core.flaw")
-- }}}

-- look {{{
local look = {
	"custom",
}
mods.beautiful.init(vars.theme_conf(look[1]))

-- Table of layouts
mods.awful.layout.layouts = vars.layouts
-- }}}

-- menu {{{
-- Create a launcher widget and a main menu
local mymainmenu = vars.menu(menu)["mymainmenu"]
local mylauncher = vars.menu(menu)["mylauncher"]

-- mods.Menubar configuration
-- Set the terminal for applications that require it
mods.menubar.utils.terminal = vars.terminal
-- }}}

-- wbar {{{

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
			mods.awful.widget.keyboardlayout(),
			mods.wibox.widget.systray(),
			mods.wibox.widget.textclock(),
			s.mylayoutbox,
		},
	})
end)
-- }}}

-- meys {{{
root.buttons(mods.gears.table.join(
	mods.awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	mods.awful.button({}, 4, mods.awful.tag.viewnext),
	mods.awful.button({}, 5, mods.awful.tag.viewprev)
))
-- }}}

-- keys {{{
local globalkeys = keys["globalkeys"]

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

-- Set keys
root.keys(globalkeys)
-- }}}

-- rule {{{
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
			keys = keys["clientkeys"],
			buttons = keys["clientbuttons"],
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

-- sign {{{
require("core.sign")
-- }}}

-- startup {{{
vars.run_at_startup()
-- }}}

-- vim: filetype=lua:expandtab:shiftwidth=2:tabstop=2:softtabstop=2:textwidth=80
