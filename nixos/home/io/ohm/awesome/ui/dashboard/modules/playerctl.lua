local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require('gears')
local helpers = require("helpers")
local bling = require("bling")
local playerctl = bling.signal.playerctl.cli()
local dpi = beautiful.xresources.apply_dpi

local player = {}

function player.music_name()
  local music_name = wibox.widget({
	  markup = "...",
	  font = "Iosevka Nerd Font Bold 13",
	  widget = wibox.widget.textbox,
  })

  local name = wibox.widget({
	  {
		  music_name,
      widget = wibox.container.margin,
	  },
    widget = wibox.container.background,
    bg = beautiful.surface0,
  })

  playerctl:connect_signal("metadata",
                       function(_, title)
  music_name:set_markup_silently(title)
  end)

  return name
end

function player.music_pic()
  local art = wibox.widget {
    image = beautiful.pfp,
    halign = 'center',
    valign = 'center',
    forced_width = dpi(96),
    forced_height = dpi(96),
    horizontal_fit_policy = 'fit',
    vertical_fit_policy = 'fit',
    resize = true,
    widget = wibox.widget.imagebox,
  }

  local art_widget = wibox.widget({
    {
      art,
      widget = wibox.container.place,
    },
    widget = wibox.container.background,
    bg = beautiful.surface0,
  })

  playerctl:connect_signal("metadata",
                       function(_, album_path)
    art:set_image(gears.surface.load_uncached(album_path))
  end)

  return art_widget
end

function player.widget()
  return wibox.widget({
    {
      player.music_name(),
      player.music_pic(),
      layout = wibox.layout.fixed.vertical,
    },
    widget = wibox.container.background,
    bg = beautiful.surface0,
    fg = beautiful.blue,
    shape = helpers.rrect(6),
  })
end

return player
