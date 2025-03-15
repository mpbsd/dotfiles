-- require awesome modules
local mods = require("core.mods")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- Error handling
require("core.errr")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
local theme = function(theme_number)
	local name = {
		"custom",
	}
	local path = "<HOME>/.config/awesome/themes/<name>/theme.lua"
	local repl = {
		["<HOME>"] = os.getenv("HOME"),
		["<name>"] = name[theme_number],
	}
	return path:gsub("<[^>]+>", repl)
end
mods.beautiful.init(theme(1))

-- This is used later as the default terminal and editor to run.
local terminal = "st -e tmux"
local editor = os.getenv("EDITOR") or "vi"
local editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod1"

-- Table of layouts to cover with mods.awful.layout.inc, order matters.
mods.awful.layout.layouts = {
	mods.awful.layout.suit.tile,
	mods.awful.layout.suit.floating,
	mods.awful.layout.suit.max,
	mods.awful.layout.suit.tile.left,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
	{
		"hotkeys",
		function()
			mods.awful.hotkeys_popup.show_help(nil, mods.awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local menu_awesome = {
	"awesome",
	myawesomemenu,
	mods.beautiful.awesome_icon,
}
local menu_terminal = { "open terminal", terminal }

local mymainmenu = nil

if has_fdo then
	mymainmenu = freedesktop.menu.build({
		before = { menu_awesome },
		after = { menu_terminal },
	})
else
	mymainmenu = mods.awful.menu({
		items = {
			menu_awesome,
			{ "Debian", debian.menu.Debian_menu.Debian },
			menu_terminal,
		},
	})
end

local mylauncher = mods.awful.widget.launcher({ image = mods.beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
mods.menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
local mykeyboardlayout = mods.awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = mods.wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = mods.gears.table.join(
	mods.awful.button({}, 1, function(t)
		t:view_only()
	end),
	mods.awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	mods.awful.button({}, 3, mods.awful.tag.viewtoggle),
	mods.awful.button({ modkey }, 3, function(t)
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
	mods.awful.tag({
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
	}, s, mods.awful.layout.layouts[1])

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

	-- Create the wibox
	s.mywibox = mods.awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
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

-- Set keys
require("core.keys")

-- {{{ rules
require("core.rule")
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then mods.awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		mods.awful.placement.no_offscreen(c)
	end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = mods.beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = mods.beautiful.border_normal
end)
-- }}}
