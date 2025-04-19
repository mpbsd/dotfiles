local mods = require("core.mods")
local vars = require("core.vars")

local G = {
	items = {
		-- awesome {{{
		{
			"awesome",
			{
				{
					"hotkeys",
					function()
						mods.hotkeys_popup.show_help(nil, mods.awful.screen.focused())
					end,
				},
				{
					"manual",
					vars.terminal .. " -e man awesome",
				},
				{
					"config",
					vars.editor_cmd .. " " .. awesome.conffile,
				},
				{
					"restart",
					awesome.restart,
				},
				{
					"quit",
					function()
						awesome.quit()
					end,
				},
			},
		},
		-- }}}
		-- accessories {{{
		{
			"accessories",
			{
				{
					"calibre",
					"calibre",
				},
				{
					"files",
					vars.terminal .. " -e vifm",
				},
				{
					"editor",
					vars.editor_cmd,
				},
				{
					"terminal",
					vars.terminal,
				},
			},
		},
		-- }}}
		-- games {{{
		{
			"games",
			{
				{
					"hedgewars",
					"hedgewars",
				},
			},
		},
		-- }}}
		-- graphics {{{
		{
			"graphics",
			{
				{
					"gimp",
					"gimp",
				},
				{
					"inkscape",
					"inkscape",
				},
			},
		},
		-- }}}
		-- internet {{{
		{
			"internet",
			{
				{
					"chromium",
					"chromium",
				},
				{
					"firefox",
					"firefox-esr",
				},
				{
					"irssi",
					vars.terminal .. " -e irssi",
				},
				{
					"mutt",
					vars.terminal .. " -e mutt",
				},
				{
					"newsboat",
					vars.terminal .. " -e newsboat",
				},
				{
					"telegram",
					"telegram-desktop",
				},
			},
		},
		-- }}}
		-- office {{{
		{
			"office",
			{
				{
					"kile",
					"kile",
				},
				{
					"libreoffice",
					"libreoffice",
				},
				{
					"okular",
					"okular",
				},
				{
					"xournalpp",
					"xournalpp",
				},
			},
		},
		-- }}}
	},
}

return G
