local libs = require("core.libs")
local vars = require("core.vars")

local M = {
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
		-- terminal {{{
		{
			"terminal",
			vars.terminal,
		},
		-- }}}
	},
}

return M
