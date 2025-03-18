local libs = require("core.libs")

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
