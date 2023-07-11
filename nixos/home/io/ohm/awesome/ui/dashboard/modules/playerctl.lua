local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require('gears')
local helpers = require("helpers")
local bling = require("bling")
local naughty = require('naughty')
local playerctl = bling.signal.playerctl.cli()
local dpi = beautiful.xresources.apply_dpi

local player = {}

function player.music_name()
  local music_name = wibox.widget({
	  markup = "...",
	  font = "Iosevka Nerd Font Bold 13",
	  widget = wibox.widget.textbox,
    halign = 'center',
    valign = 'center',
  })

  local name = wibox.widget({
	  {
		  music_name,
      widget = wibox.container.place,
	  },
    layout = wibox.container.place,
    halign = 'center',
    valign = 'center',
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
    --horizontal_fit_policy = 'fit',
    --vertical_fit_policy = 'fit',
    resize = true,
    widget = wibox.widget.imagebox,
  }

  local art_widget = wibox.widget({
    {
      art,
      widget = wibox.container.place,
    },
    layout = wibox.container.place,
    halign = 'center',
    valign = 'center',
  })

  playerctl:connect_signal("metadata",
                       function(_, title, artist, album_path)
    art:set_image(gears.surface.load_uncached(album_path))
  end)

  return art_widget
end

function player.widget()
  return wibox.widget({
    {
      player.music_pic(),
      player.music_name(),

      layout = wibox.layout.stack,
      vertical_offset = dpi(70),
    },
    widget = wibox.container.background,
    bg = beautiful.surface0,
    fg = beautiful.blue,
    shape = helpers.rrect(6),
    forced_height = dpi(400),
    forced_width = dpi(200),
  })
end

return player
