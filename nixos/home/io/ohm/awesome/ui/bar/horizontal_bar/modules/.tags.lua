local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'
local beautiful = require 'beautiful'
local helpers = require 'helpers'
local bling = require 'bling'
local rubato = require 'rubato'
local xresources = require 'beautiful.xresources'
local dpi = xresources.apply_dpi

local function get_taglist (s)
	return awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		layout = {
			spacing = 10,
			layout = wibox.layout.fixed.horizontal,
		},
		buttons = {
      		  awful.button({}, 1, function(t) t:view_only() end),
      		  awful.button({}, 4, function(t)
        	    awful.tag.viewprev(t.screen)
      		  end),
      		  awful.button({}, 5, function(t)
        	    awful.tag.viewnext(t.screen)
      		  end)
    		},
		widget_template = {
			{
			    {
				markup = '',
				shape = gears.shape.rounded_bar,
				forced_height = 20,
				widget = wibox.widget.textbox,
			    },
				forced_height = dpi(20),
				forced_width = dpi(20),
				shape = gears.shape.rounded_bar,
				halign = 'center',
				id = 'background_role',
				widget = wibox.container.background,
			},
			halign = 'center',
			widget = wibox.container.place,
			 create_callback = function(self, tag)
		            local bg = self:get_children_by_id('background_role')[1]

			    self.animate = rubato.timed { duration = 0.15 }

			    self.animate:subscribe(function (pos)
					bg.forced_width = pos
			    end)

        		    self.update = function()
          			if tag.selected then
				    self.animate.target = 20
          			elseif #tag:clients() > 0 then
				    self.animate.target = 20
          			else
				    self.animate.target = 20
          			end
        		    end

        		   self.update()
      			end,
      			update_callback = function(self)
        		    self.update()
      			end,
    },
}
end

local function main (s)
	local bg = wibox.widget {
		{
			get_taglist(s),
			top = 13,
			bottom = 13,
     			left = 10,
      			right = 10,
			widget = wibox.container.margin,
		},
		bg = beautiful.surface0,
		shape = gears.shape.rounded_rect,
		widget = wibox.container.background,
	}

	helpers.add_hover(bg, beautiful.surface0, beautiful.surface2)

	local container = wibox.widget {
		bg,
		widget = wibox.container.margin,
	}

	return container
end

return main
