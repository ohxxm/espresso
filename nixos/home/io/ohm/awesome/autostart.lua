local awful = require('awful')

awful.spawn.with_shell("xinput --set-prop 'pointer:Logitech G305' 'libinput Accel Profile Enabled' 0, 1")
