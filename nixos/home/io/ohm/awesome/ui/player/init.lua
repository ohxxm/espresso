local beautiful = require('beautiful')
local awful = require('awful')
local bling = require('bling')
local helpers = require('helpers')
local gears = require('gears')
local wibox = require('wibox')
local playerctl = bling.signal.playerctl.lib()
local dpi = beautiful.xresources.apply_dpi

local picture = wibox.widget {
    image = 'default.png',
    halign = 'center',
    forced_width = dpi(48),
    forced_height = dpi(48),
    horizontal_fit_policy = 'fit',
    vertical_fit_policy = 'fit',
    valign = 'center',
    clip_shape = helpers.rrect(12),
    widget = wibox.widget.imagebox,
}

local title_widget = wibox.widget {
    markup = 'Nothing Playing',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

playerctl:connect_signal("metadata",
                      function(_, music_album_path, music_title)
   -- Set art widget
   picture:set_image(gears.surface.load_uncached(music_album_path))
   title_widget:set_markup_silently(music_title) 
end)

player = wibox({
  bgimage = beautiful.bg_normal,
  bg = beautiful.bg_normal,
  width = dpi(750),
  height = dpi(450),
  y = dpi(450),
  x = dpi(900),
  ontop = true,
  visible = false,
  shape = helpers.rrect(12),
})

player:setup({
  layout = wibox.layout.stack,
  {
    halign = "center",
    valign = "center",
    layout = wibox.container.place,
  },
  {
    layout = wibox.layout.align.vertical,
    {
      art,
      layout = wibox.layout.fixed.vertical,
    },
    nil,
    {
      layout = wibox.layout.fixed.vertical,
    },
  }
})

return player
