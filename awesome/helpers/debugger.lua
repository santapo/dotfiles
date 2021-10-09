local naughty = require("naughty")


return function(msg)
    naughty.notification {
        naughty.notification {
            urgency = 'critical',
            title = "Debugger",
            message = tostring(msg)
        }
    }
end