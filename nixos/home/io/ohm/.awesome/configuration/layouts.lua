---@diagnostic disable: undefined-global
local awful = require "awful"
local bling = require 'modules.bling'

local function set_layouts()
    tag.connect_signal("request::default_layouts", function ()
        awful.layout.append_default_layouts {
	    bling.layout.centered,	
            awful.layout.suit.floating,
            awful.layout.suit.max,
        }
    end)
end

set_layouts()
