local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local helpers = require("helpers")
local wibox = require("wibox")
require("../../user_likes")

mymainmenu = awful.menu({
	items = {
		{
			"Terminal",
			function()
				awful.spawn.with_shell(terminal)
			end,
			beautiful.terminal_icon,
		},
		{ "File Manager", file_manager, beautiful.file_manager_icon },
		{ "Browser", browser, beautiful.browser_icon },
		{ "Editor", editor, beautiful.editor_icon },
		{ "Screenshot", screenshot_tool, beautiful.screenshot_icon },
		{ "AwesomeWM", awesomeWM_options, beautiful.awesome_icon },
		{ "NixOS", nixos_options, beautiful.nixos_icon },
	},
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
-- {{{ Menu
-- Create a launcher widget and a main menu
awesomeWM_options = {
	{ "Edit Config", editor_cmd .. " " .. awesome.conffile },
	{ "Restart", awesome.restart },
	{
		"Exit Awesome",
		function()
			awesome.quit()
		end,
	},
}

nixos_options = {
	{
		"Reboot",
		function()
			awful.spawn.with_shell("reboot")
		end,
	},
	{
		"Shutdown",
		function()
			awful.spawn.with_shell("poweroff")
		end,
	},
	{
		"Suspend",
		function()
			awful.spawn.with_shell("systemctl suspend")
		end,
	},
}
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Round corners even when picom is not available

mymainmenu.wibox.shape = helpers.mkroundedrect()
mymainmenu.wibox:set_widget(wibox.widget({
	mymainmenu.wibox.widget,
	shape = helpers.mkroundedrect(12),
	widget = wibox.container.background,
}))
