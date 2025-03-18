local libs = require("core.libs")
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
						libs.hotkeys_popup.show_help(nil, libs.awful.screen.focused())
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
					vars.terminal .. " -e lf",
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
			},
		},
		-- }}}
	},
}

return G
