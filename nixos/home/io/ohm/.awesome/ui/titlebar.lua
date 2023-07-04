local awful = require 'awful'
local wibox = require 'wibox'
local xresources = require 'beautiful.xresources'
local beautiful = require 'beautiful'

local dpi = xresources.apply_dpi

client.connect_signal('request::titlebars', function (c)
    local titlebar = awful.titlebar(c, {
        position = 'top',
        size = 35,
	font = "Product Sans 12", 
    })

    local titlebars_buttons = {
        awful.button({}, 1, function ()
            c:activate {
                context = 'titlebar',
                action = 'mouse_move',
            }
        end),
        awful.button({}, 3, function ()
            c:activate {
                context = 'titlebar',
                action = 'mouse_resize',
            }
        end)
    }

    local buttons_loader = {
        layout = wibox.layout.fixed.horizontal,
        buttons = titlebars_buttons,
    }

    local function paddined_button(button, margins)
        margins = margins or {
            top = 13,
            bottom = 13,
            left = 4,
            right = 4
        }

        return wibox.widget {
            button,
            top = margins.top,
            bottom = margins.bottom,
            left = margins.left,
            right = margins.right,
            widget = wibox.container.margin,
        }
    end

    titlebar:setup {
	{
	   button = buttons,
	   layout = wibox.layout.fixed.horizontal
	},
        {
	    {
              halign = "center",
              widget = awful.titlebar.widget.titlewidget(c),
	    },
            buttons = buttons,
	    layout = wibox.layout.flex.horizontal
        },
	{
	    paddined_button(awful.titlebar.widget.maximizedbutton(c), {
		top = 10, 
		bottom = 10,
	    }),
            paddined_button(awful.titlebar.widget.closebutton(c), {
                top = 10,
                bottom = 10,
                right = 14,
                left = 10,
            }),
            layout = wibox.layout.fixed.horizontal(),
	},
        buttons_loader,
        buttons_loader,
        layout = wibox.layout.align.horizontal
    }
end)
