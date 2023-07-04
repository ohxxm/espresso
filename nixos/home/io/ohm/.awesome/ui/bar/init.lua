local awful = require 'awful'
local beautiful = require 'beautiful'
local wibox = require 'wibox'
local gears = require 'gears'
local rubato = require 'modules.rubato'
local taglist = require 'ui.bar.modules.tags'
local margin = wibox.container.margin

---@diagnostic disable-next-line: undefined-global
screen.connect_signal('request::desktop_decoration', function (s)
  awful.tag(
    {'1', '2', '3', '4', '5'},
    s, awful.layout.layouts[1]
  )

  local wb = awful.wibar {
    position = "top"
  }

  local clock = wibox.widget({
    widget = wibox.widget.textclock,
    format = "%I:%M %p",
  })

  s.mylayouts = awful.widget.layoutbox {
    screen  = s,
    buttons = {
      awful.button({ }, 1, function () awful.layout.inc( 1) end),
      awful.button({ }, 3, function () awful.layout.inc(-1) end),
      awful.button({ }, 4, function () awful.layout.inc(-1) end),
      awful.button({ }, 5, function () awful.layout.inc( 1) end),
    }
  }

  wb:setup {
    layout = wibox.layout.align.horizontal,
    --{
    --  layout = wibox.layout.align.horizontal,
    --  margin(s.mylayouts, 10, 10, 3, 3),
    --  margin(clock, 0, 10, 0, 0),
    --},
    {
      {
       widget = wibox.container.margin,
       taglist(s),
      },
      widget = wibox.container.place,
      halign = 'center',
      valign = 'center',
    },
  }
end)
