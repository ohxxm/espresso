---------------------------
-- Default awesome theme --
---------------------------
require("../user_likes")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local gears = require("gears")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local image_path = gfs.get_configuration_dir() .. "assets/"
local theme = require("themes.colors.catppuccin")

-- BORDER & GAPS
theme.useless_gap = dpi(8)
theme.border_width = dpi(3)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = theme.bg_normal
theme.border_color_marked = theme.mantle

theme.taglist_bg_focus = theme.blue
theme.taglist_bg_empty = theme.overlay0
theme.taglist_bg_occupied = theme.red

-- TITLEBAR
theme.titlebar_font = "Iosevka Nerd Font Semibold Italic 13"

-- BORDER RADIUS
theme.border_radius = dpi(12)

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus = theme.bg_normal

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.notification_bg = theme.base
theme.notification_fg = theme.sky
theme.notification_border_width = 0
theme.notification_width = 400
theme.notification_height = 100

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(50)
theme.menu_width = dpi(200)
theme.menu_font = "Iosevka Nerd Font Bold 13"
theme.menu_fg_normal = theme.text
theme.menu_border_width = 10
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.pfp = image_path .. "pfp.jpg"
theme.terminal_icon = gears.color.recolor_image(image_path .. "terminal_icon.png", theme.blue)
theme.file_manager_icon = gears.color.recolor_image(image_path .. "file_manager_icon.png", theme.green)
theme.browser_icon = gears.color.recolor_image(image_path .. "browser_icon.png", theme.red)
theme.editor_icon = gears.color.recolor_image(image_path .. "editor_icon.png", theme.mauve)
theme.screenshot_icon = gears.color.recolor_image(image_path .. "screenshot_icon.png", theme.rosewater)
theme.nixos_icon = image_path .. "nixos_logo.png"
theme.reboot_icon = gears.color.recolor_image(image_path .. "reboot_icon.png", theme.green)
theme.shutdown_icon = gears.color.recolor_image(image_path .. "shutdown_icon.png", theme.red)
theme.suspend_icon = gears.color.recolor_image(image_path .. "suspend_icon.png", theme.blue)

theme.titlebar_close_button_normal = gears.color.recolor_image(image_path .. "circle.png", theme.mauve)
theme.titlebar_close_button_focus = gears.color.recolor_image(image_path .. "circle.png", theme.mauve)

theme.titlebar_minimize_button_normal = gears.color.recolor_image(image_path .. "circle.png", theme.yellow)
theme.titlebar_minimize_button_focus = gears.color.recolor_image(image_path .. "circle.png", theme.yellow)

theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(image_path .. "circle.png", theme.blue)
theme.titlebar_maximized_button_focus_inactive = gears.color.recolor_image(image_path .. "circle.png", theme.blue)
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(image_path .. "circle.png", theme.blue)
theme.titlebar_maximized_button_focus_active = gears.color.recolor_image(image_path .. "circle.png", theme.blue)

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/titlebar/floating_focus_active.png"

theme.wallpaper = wallpaper

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = gears.color.recolor_image(themes_path .. "default/layouts/floatingw.png", theme.text)
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"
theme.layout_centered =
	gears.color.recolor_image(gfs.get_configuration_dir() .. "bling/icons/layouts/centered.png", theme.text)

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(30, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
	rnotification.append_rule({
		rule = { urgency = "critical" },
		properties = { bg = theme.base, fg = theme.text },
	})
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
