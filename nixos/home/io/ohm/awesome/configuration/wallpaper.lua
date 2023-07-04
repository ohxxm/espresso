local beautiful = require("beautiful")
local gears = require("gears")
require("../user_likes")

beautiful.init(theme)
for s = 1, screen.count() do
	gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end
