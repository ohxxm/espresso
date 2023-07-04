-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local beautiful = require("beautiful")
local awful = require("awful")
local bling = require("bling")
local helpers = require("helpers")
local decorations = require('ui.desktop.rounded_corners')

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("configuration")
require("ui")
require("./autostart")
require("./user_likes")

beautiful.init(theme)
decorations.enable_rounding()
