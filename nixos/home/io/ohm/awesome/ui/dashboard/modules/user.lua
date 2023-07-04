local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require('gears')
local helpers = require("helpers")
local dpi = beautiful.xresources.apply_dpi

local user = {}

function user.uptime()
  local uptime = wibox.widget({
    markup="...",
    font = "Iosevka Nerd Font 10",
    widget = wibox.widget.textbox,
  })
end

function user.name()
  local username = wibox.widget({
	  markup = "...",
	  font = "Iosevka Nerd Font Bold 20",
	  widget = wibox.widget.textbox,
  })

  awful.spawn.easy_async_with_shell("whoami", function(whoami)
	  username:set_markup_silently("@" .. whoami)
  end)

  local name = wibox.widget({
	  {
		  username,
      widget = wibox.container.margin,
	  },
    widget = wibox.container.background,
    bg = beautiful.surface0,
  })
  return name
end

function user.pfp()
  local picture = wibox.widget {
    image = beautiful.pfp,
    halign = 'center',
    valign = 'center',
    forced_width = dpi(96),
    forced_height = dpi(96),
    horizontal_fit_policy = 'fit',
    vertical_fit_policy = 'fit',
    clip_shape = gears.shape.circle,
    widget = wibox.widget.imagebox,
  }

  local pfp = wibox.widget({
    {
      picture,
      widget = wibox.container.background,
    },
    widget = wibox.container.background,
    bg = beautiful.surface0,
  })

  return pfp
end

function user.widget()
  return wibox.widget({
    {
      user.pfp(),
      user.name(),
      layout = wibox.layout.fixed.horizontal,
    },
    widget = wibox.container.background,
    bg = beautiful.surface0,
    fg = beautiful.blue,
    shape = helpers.rrect(6),
  })
end

return user
