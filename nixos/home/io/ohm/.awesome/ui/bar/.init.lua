local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'
local rubato = require 'modules.rubato'
local beautiful = require 'beautiful'
local margin = wibox.container.margin

---@diagnostic disable-next-line: undefined-global
screen.connect_signal('request::desktop_decoration', function (s)
    awful.tag(
        {'1', '2', '3', '4', '5'},
        s, awful.layout.layouts[1]
    )
    
    local wb = awful.wibar {
        position = "top",
	x = s.geometry.x + beautiful.useless_gap * 2,
	y = 10,
	width = s.geometry.width - beautiful.useless_gap * 4,
	height = beautiful.bar_height,
    }

    clock = wibox.widget({
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

    s.workspaces = awful.widget.taglist {
	screen = s,
	filter = awful.widget.taglist.filter.all,
	shape = {
	    shape = gears.shape.circle,
	},
	layout = {
	    spacing = 1,
	},
	buttons = {
	    awful.button({}, 1, function (t)
		    t:view_only ()
	    end),
	    awful.button({}, 4, function (t) 
		    awful.tag.viewprev(t.screen)
	    end),
	    awful.button({}, 5, function (t)
		    awful.tag.viewnext(t.screen)
	    end),
	},
	widget_template = {
	    {
		markup = '',
		widget = wibox.widget.textbox,
	    },
	    id = 'background_role',
	    forced_height = 7,
	    forced_width = 7,
	    widget = wibox.container.background,
	    create_callback = function (self, tag)
		    self.animate = rubato.timed {
			duration = 0.15,
			subscribed = function (h)
			    self:get_children_by_id('background_role')[1].forced_height = h
			end
		    }

		    self.update = function ()
			    if tag.selected then
				    self.animated_target = 18
			    elseif #tag:clients() > 0 then
				    self.animate.target = 14
			    else
				    self.animate.target = 8
			    end
		    end

		    self.update()
	    end,
	    update_callback = function (self)
		    self.update()
	    end,
	},
    }

    wb:setup {
  layout = wibox.layout.stack,
  {
    layout = wibox.layout.align.horizontal,
    margin(s.mylayouts, 10, 10, 3, 3),
    nil,
    margin(clock, 0, 10, 0, 0),
  },
  {
    widget = wibox.container.place,
    valign = 'center',
    halign = 'center',
    s.workspaces,
  }
}

end)
