local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local rubato = require("rubato")
local beautiful = require("beautiful")
local bling = require("bling")
local helpers = require("helpers")
local box = require("ui.dashboard")

local function workspaces(s)
	return awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		style = {
			shape = gears.shape.rounded_bar,
		},
		layout = {
			spacing = 10,
			layout = wibox.layout.fixed.horizontal,
		},
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({}, 4, function(t)
				awful.tag.viewprev(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewnext(t.screen)
			end),
		},
		widget_template = {
			{
				markup = "",
				widget = wibox.widget.textbox,
				shape = gears.shape.rounded_bar,
			},
			id = "background_role",
			forced_height = 20,
			forced_width = 31,
			shape = gears.shape.rounded_bar,
			widget = wibox.container.background,
			create_callback = function(self, tag, c3)
				self.animate = rubato.timed({
					duration = 0.20,
					subscribed = function(h)
						self:get_children_by_id("background_role")[1].forced_width = h
					end,
				})

				self.update = function()
					if tag.selected then
						self.animate.target = 60
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
	})
end

local function main(s)
	local bg = wibox.widget({
		{
			workspaces(s),
			top = 15,
			bottom = 15,
			left = 15,
			right = 15,
			widget = wibox.container.margin,
		},
		bg = beautiful.bg_normal,
		--	shape = gears.shape.rounded_rect,
		widget = wibox.container.background,
		buttons = { gears.table.join(awful.button({}, 1, function()
			box.visible = not box.visible
		end)) },
	})

	-- helpers.add_hover(bg, beautiful.surface0, beautiful.surface2)

	return bg
end

return main
