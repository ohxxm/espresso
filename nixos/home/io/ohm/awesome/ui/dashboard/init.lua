local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local gears = require("gears")
local awful = require("awful")
local bling = require("bling")
local margin = wibox.container.margin
local dpi = beautiful.xresources.apply_dpi

local user = require("ui.dashboard.modules.user")
local player = require("ui.dashboard.modules.playerctl")

box = wibox({
	bgimage = beautiful.bg_normal,
	width = dpi(700),
	height = dpi(700),
	x = dpi(930),
	y = dpi(100),
	ontop = true,
	shape = helpers.rrect(12),
	visible = false,
})

box:setup({
	-- Top center
	layout = wibox.layout.stack,
	{
    {
      margin(user.widget(), 10, 10, 10, 10),
      player.widget(),
      layout = wibox.layout.align.horizontal,
    },
		halign = "center",
		valign = "top",
		layout = wibox.container.place,
	},
})

return box
