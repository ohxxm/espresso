local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local helpers = require("helpers")
local gears = require("gears")
local color = require("gears.color")
local gfs = require("gears.filesystem")
local bling = require("bling")

require("../../../user_likes")

local gettaglist = require("ui.bar.horizontal_bar.modules.tags")
local box = require("ui.dashboard")

local image_path = gfs.get_configuration_dir() .. "assets/"
local margin = wibox.container.margin
local dpi = beautiful.xresources.apply_dpi

screen.connect_signal("request::desktop_decoration", function(s)
	awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

	systray = wibox.widget({
		widget = wibox.widget.systray,
		visible = true,
	})

	clock = wibox.widget({
		widget = wibox.widget.textclock,
		format = "%I:%M %p",
		font = "Iosevka Nerd Font ExtraBold 16",
	})

	s.mylayouts = awful.widget.layoutbox({
		screen = s,
		forced_height = 30,
		buttons = {
			awful.button({}, 1, function()
				awful.layout.inc(1)
			end),
			awful.button({}, 3, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 4, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 5, function()
				awful.layout.inc(1)
			end),
		},
	})

	s.bar = awful.wibar({
		position = "top",
		screen = s,
		height = 60,
		margins = 10,
		shape = helpers.rrect(6),
		widget = {
			-- Center
			layout = wibox.layout.stack,
			{
				gettaglist(s),
				halign = "center",
				valign = "center",
				layout = wibox.container.place,
			},
			-- LEFT
			{
				layout = wibox.layout.align.horizontal,
				{
					layout = wibox.layout.fixed.horizontal,
					margin(s.mylayouts, 15, 0, 10, 10),
				},
				nil,
				-- RIGHT
				{
					layout = wibox.layout.fixed.horizontal,
					margin(systray, 0, 10, 15, 15),
					margin(clock, 15, 15, 0, 0),
				},
			},
		},
	})
end)
