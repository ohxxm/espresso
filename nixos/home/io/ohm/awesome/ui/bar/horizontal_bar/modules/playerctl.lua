local bling = require("bling")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local helpers = require("helpers")
local awful = require("awful")
local naughty = require("naughty")

local box = require("ui.dashboard")
local playerctl = bling.signal.playerctl.lib()

local function playerctl_title()
	title = wibox.widget({
		markup = "Nothing Playing",
		align = "center",
		widget = wibox.widget.textbox,
		buttons = { gears.table.join(awful.button({}, 1, function()
			box.visible = not box.visible
		end)) },
	})
	return title
end

--playerctl:connect_signal("metadata", function(_, title, artist, album_path, album, new, player_name)
--  title_widget:set_markup_silently(title)

--  if new == true then
--    naughty.notify({title = title, text = artist, image = album_path})
--  end
-- end)

local function main()
	local bg = wibox.widget({
		{
			playerctl_title(),
			left = 10,
			right = 10,
			widget = wibox.container.margin,
		},
		bg = beautiful.surface0,
		shape = gears.shape.rounded_rect,
		widget = wibox.container.background,
	})

	helpers.add_hover(bg, beautiful.surface0, beautiful.surface2)

	local container = wibox.widget({
		bg,
		widget = wibox.container.margin,
		left = 15,
		top = 10,
		bottom = 10,
	})

	return container
end

return main
