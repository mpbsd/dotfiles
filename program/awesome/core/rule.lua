local mods = require("core.mods")
local keys = require("core.keys")

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
	{
		rule = {
			class = "kile",
		},
		properties = {
			screen = 1,
			tag = "4",
		},
	},
	{
		rule = {
			class = "mpv",
		},
		properties = {
			screen = 1,
			tag = "7",
			floating = true,
		},
	},
	{
		rule = {
			class = "calibre",
		},
		properties = {
			screen = 1,
			tag = "8",
		},
	},
	{
		rule = {
			class = "Gimp",
		},
		properties = {
			screen = 1,
			tag = "9",
		},
	},
	{
		rule = {
			class = "Inkscape",
		},
		properties = {
			screen = 1,
			tag = "9",
		},
	},
	{
		rule = {
			class = "libreoffice",
		},
		properties = {
			screen = 1,
			tag = "6",
		},
	},
}
