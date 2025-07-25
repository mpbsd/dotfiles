local mods = require("core.mods")

local mkey = "Mod1"
local term = "st"
local tmux = "st -e tmux"
local edit = "vi"

local M = {
	-- handle_errors {{{
	handle_errors = function()
		if awesome.startup_errors then
			mods.naughty.notify({
				preset = mods.naughty.config.presets.critical,
				title = "Oops, there were errors during startup!",
				text = awesome.startup_errors,
			})
		end
		do
			local in_error = false
			awesome.connect_signal("debug::error", function(err)
				if in_error then
					return
				end
				in_error = true
				mods.naughty.notify({
					preset = mods.naughty.config.presets.critical,
					title = "Oops, an error happened!",
					text = tostring(err),
				})
				in_error = false
			end)
		end
	end,
	-- }}}
	-- theme_path {{{
	theme_path = function(name)
		local path = "<HOME>/.config/awesome/look/<name>/"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
	end,
	-- }}}
	-- theme_conf {{{
	theme_conf = function(name)
		local path = "<HOME>/.config/awesome/look/<name>/theme.lua"
		local repl = {
			["<HOME>"] = os.getenv("HOME"),
			["<name>"] = name,
		}
		return path:gsub("<[^>]+>", repl)
	end,
	-- }}}
	-- menu {{{
	menu = function(menu)
		local m = mods.awful.menu(menu)
		local M = {
			mymainmenu = m,
			mylauncher = mods.awful.widget.launcher({
				image = mods.beautiful.awesome_icon,
				menu = m,
			}),
		}
		return M
	end,
	-- }}}
	-- modkey {{{
	modkey = mkey,
	-- }}}
	-- terminal {{{
	terminal = term,
	-- }}}
	-- editor {{{
	editor = edit,
	-- }}}
	-- editor_cmd {{{
	editor_cmd = term .. " -e " .. edit,
	-- }}}
	-- layouts {{{
	layouts = {
		mods.awful.layout.suit.tile,
		mods.awful.layout.suit.max,
	},
	-- }}}
	-- set_keys {{{
	set_keys = function(keys)
		for i = 1, 9 do
			keys = mods.gears.table.join(
				keys,
				-- View tag only.
				mods.awful.key(
					{
						mkey,
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
						mkey,
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
						mkey,
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
						mkey,
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
		root.keys(keys)
	end,
	-- }}}
	-- set_buttons {{{
	set_buttons = function(buttons)
		root.buttons(buttons)
	end,
	-- }}}
	-- startup_programs {{{
	startup_programs = function()
		mods.awful.spawn("picom")
		mods.awful.spawn.with_shell("conky -c ~/.config/conky/conky.conf")
		mods.awful.spawn(tmux)
	end,
	-- }}}
}

return M
