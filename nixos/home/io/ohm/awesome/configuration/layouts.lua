local awful = require("awful")
local bling = require("bling")

awful.layout.layouts = {
	bling.layout.centered,
	awful.layout.suit.floating,
}
