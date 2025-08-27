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
			},
		},
		-- }}}
		-- media {{{
		{
			"media",
			{
				{
					"spotify",
					"flatpak run com.spotify.Client",
				},
			},
		},
		-- }}}
		-- office {{{
		{
			"office",
			{
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
				{
					"zotero",
					"flatpak run org.zotero.Zotero",
				},
			},
		},
		-- }}}
	},
}

return G
