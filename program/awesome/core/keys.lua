local mkey = "Mod1"
local akey = "Mod4"
local mods = require("core.mods")

local M = {
	globalkeys = mods.gears.table.join(
		mods.awful.key({ mkey }, "s", mods.hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
		mods.awful.key({ mkey }, "Left", mods.awful.tag.viewprev, { description = "view previous", group = "tag" }),
		mods.awful.key({ mkey }, "Right", mods.awful.tag.viewnext, { description = "view next", group = "tag" }),
		mods.awful.key({ mkey }, "Escape", mods.awful.tag.history.restore, { description = "go back", group = "tag" }),
		mods.awful.key({ mkey }, "j", function()
			mods.awful.client.focus.byidx(1)
		end, { description = "focus next by index", group = "client" }),
		mods.awful.key({ mkey }, "k", function()
			mods.awful.client.focus.byidx(-1)
		end, { description = "focus previous by index", group = "client" }),
		mods.awful.key({ mkey }, "w", function()
			mymainmenu:show()
		end, { description = "show main menu", group = "awesome" }),
		-- Layout manipulation
		mods.awful.key({ mkey, "Shift" }, "j", function()
			mods.awful.client.swap.byidx(1)
		end, { description = "swap with next client by index", group = "client" }),
		mods.awful.key({ mkey, "Shift" }, "k", function()
			mods.awful.client.swap.byidx(-1)
		end, { description = "swap with previous client by index", group = "client" }),
		mods.awful.key({ mkey, "Control" }, "j", function()
			mods.awful.screen.focus_relative(1)
		end, { description = "focus the next screen", group = "screen" }),
		mods.awful.key({ mkey, "Control" }, "k", function()
			mods.awful.screen.focus_relative(-1)
		end, { description = "focus the previous screen", group = "screen" }),
		mods.awful.key(
			{ mkey },
			"u",
			mods.awful.client.urgent.jumpto,
			{ description = "jump to urgent client", group = "client" }
		),
		mods.awful.key({ mkey }, "Tab", function()
			mods.awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end, { description = "go back", group = "client" }),
		-- Standard program
		mods.awful.key({ mkey }, "Return", function()
			mods.awful.spawn(terminal)
		end, { description = "open a terminal", group = "launcher" }),
		mods.awful.key({ mkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
		mods.awful.key({ mkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
		mods.awful.key({ mkey }, "l", function()
			mods.awful.tag.incmwfact(0.05)
		end, { description = "increase master width factor", group = "layout" }),
		mods.awful.key({ mkey }, "h", function()
			mods.awful.tag.incmwfact(-0.05)
		end, { description = "decrease master width factor", group = "layout" }),
		mods.awful.key({ mkey, "Shift" }, "h", function()
			mods.awful.tag.incnmaster(1, nil, true)
		end, { description = "increase the number of master clients", group = "layout" }),
		mods.awful.key({ mkey, "Shift" }, "l", function()
			mods.awful.tag.incnmaster(-1, nil, true)
		end, { description = "decrease the number of master clients", group = "layout" }),
		mods.awful.key({ mkey, "Control" }, "h", function()
			mods.awful.tag.incncol(1, nil, true)
		end, { description = "increase the number of columns", group = "layout" }),
		mods.awful.key({ mkey, "Control" }, "l", function()
			mods.awful.tag.incncol(-1, nil, true)
		end, { description = "decrease the number of columns", group = "layout" }),
		mods.awful.key({ mkey }, "space", function()
			mods.awful.layout.inc(1)
		end, { description = "select next", group = "layout" }),
		mods.awful.key({ mkey, "Shift" }, "space", function()
			mods.awful.layout.inc(-1)
		end, { description = "select previous", group = "layout" }),
		mods.awful.key({ mkey, "Control" }, "n", function()
			local c = mods.awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end, { description = "restore minimized", group = "client" }),
		-- Prompt
		mods.awful.key({ mkey }, "r", function()
			mods.awful.screen.focused().mypromptbox:run()
		end, { description = "run prompt", group = "launcher" }),
		mods.awful.key({ mkey }, "x", function()
			mods.awful.prompt.run({
				prompt = "Run Lua code: ",
				textbox = mods.awful.screen.focused().mypromptbox.widget,
				exe_callback = mods.awful.util.eval,
				history_path = mods.awful.util.get_cache_dir() .. "/history_eval",
			})
		end, { description = "lua execute prompt", group = "awesome" }),
		-- Menubar
		mods.awful.key({ mkey }, "p", function()
			menubar.show()
		end, { description = "show the menubar", group = "launcher" })
	),
	clientkeys = mods.gears.table.join(
		mods.awful.key({ mkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		mods.awful.key({ mkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		mods.awful.key(
			{ mkey, "Control" },
			"space",
			mods.awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		mods.awful.key({ mkey, "Control" }, "Return", function(c)
			c:swap(mods.awful.client.getmaster())
		end, { description = "move to master", group = "client" }),
		mods.awful.key({ mkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),
		mods.awful.key({ mkey }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "toggle keep on top", group = "client" }),
		mods.awful.key({ mkey }, "n", function(c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end, { description = "minimize", group = "client" }),
		mods.awful.key({ mkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)maximize", group = "client" }),
		mods.awful.key({ mkey, "Control" }, "m", function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end, { description = "(un)maximize vertically", group = "client" }),
		mods.awful.key({ mkey, "Shift" }, "m", function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end, { description = "(un)maximize horizontally", group = "client" })
	),
	clientbuttons = mods.gears.table.join(
		mods.awful.button({}, 1, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
		end),
		mods.awful.button({ mkey }, 1, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			mods.awful.mouse.client.move(c)
		end),
		mods.awful.button({ mkey }, 3, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			mods.awful.mouse.client.resize(c)
		end)
	),
}
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	M.globalkeys = mods.gears.table.join(
		M.globalkeys,
		-- View tag only.
		mods.awful.key({ mkey }, "#" .. i + 9, function()
			local screen = mods.awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		mods.awful.key({ mkey, "Control" }, "#" .. i + 9, function()
			local screen = mods.awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				mods.awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		mods.awful.key({ mkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		mods.awful.key({ mkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

-- Set keys
root.keys(M.globalkeys)
