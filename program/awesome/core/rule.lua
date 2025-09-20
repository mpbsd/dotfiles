local mods = require("core.mods")
local keys = require("core.keys")

mods.awful.rules.rules = {
	-- All clients will match this rule {{{
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
	-- }}}
	-- Floating clients {{{
	{
		rule_any = {
			instance = {
				"DTA",
				"copyq",
				"pinentry",
				"gcr-prompter",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",
				"Sxiv",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"Gcr-prompter",
			},
			name = {
				"Event Tester",
			},
			role = {
				"AlarmWindow",
				"ConfigManager",
				"pop-up",
			},
		},
		properties = {
			floating = true,
			placement = mods.awful.placement.centered,
		},
	},
	-- }}}
	-- remove titlebars from normal clients and dialogs {{{
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
	-- }}}
	-- alacritty {{{
	{
		rule = {
			class = "Alacritty",
		},
		properties = {
			screen = 1,
			tag = "1",
		},
	},
	-- }}}
	-- chromium {{{
	{
		rule = {
			class = "Chromium",
		},
		properties = {
			screen = 1,
			tag = "2",
		},
	},
	-- }}}
	-- conky {{{
	{
		rule = {
			class = "Conky",
		},
		properties = {
			screen = 1,
			tag = "9",
		},
	},
	-- }}}
	-- cool retro term {{{
	{
		rule = {
			class = "cool-retro-term",
		},
		properties = {
			screen = 1,
			tag = "1",
		},
	},
	-- }}}
	-- firefox {{{
	{
		rule = {
			class = "firefox-esr",
		},
		properties = {
			screen = 1,
			tag = "2",
		},
	},
	-- }}}
	-- gimp {{{
	{
		rule = {
			class = "Gimp",
		},
		properties = {
			screen = 1,
			tag = "8",
		},
	},
	-- }}}
	-- gvim {{{
	{
		rule = {
			class = "Gvim",
		},
		properties = {
      floating = true,
			placement = mods.awful.placement.centered,
			screen = 1,
			tag = "1",
		},
	},
	-- }}}
	-- inkscape {{{
	{
		rule = {
			class = "Inkscape",
		},
		properties = {
			screen = 1,
			tag = "8",
		},
	},
	-- }}}
	-- kile {{{
	{
		rule = {
			class = "kile",
		},
		properties = {
			screen = 1,
			tag = "4",
		},
	},
	-- }}}
	-- kitty {{{
	{
		rule = {
			class = "kitty",
		},
		properties = {
			screen = 1,
			tag = "1",
		},
	},
	-- }}}
	-- mpv {{{
	{
		rule = {
			class = "mpv",
		},
		properties = {
			floating = true,
			placement = mods.awful.placement.centered,
			screen = 1,
			tag = "6",
		},
	},
	-- }}}
	-- spotify {{{
	{
		rule = {
			class = "Spotify",
		},
		properties = {
			screen = 1,
			tag = "6",
		},
	},
	-- }}}
	-- st {{{
	{
		rule = {
			class = "st",
		},
		properties = {
			screen = 1,
			tag = "1",
		},
	},
	-- }}}
	-- xournalpp {{{
	{
		rule = {
			class = "Xournalpp",
		},
		properties = {
			screen = 1,
			tag = "5",
		},
	},
	-- }}}
	-- zotero {{{
	{
		rule = {
			class = "Zotero",
		},
		properties = {
			screen = 1,
			tag = "4",
		},
	},
	-- }}}
}
