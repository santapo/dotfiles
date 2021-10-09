local beautiful = require('beautiful');
local xrdb = beautiful.xresources.get_current_theme();

local config = {
    global = {
        m = 10,
        r = 7,

    },
    fonts = {
        im = "Material Design Icons Desktop 14"
    },
    icons = {
        arch = '󰣇',
    },
    colors = {
        w = '#fefefe',
        x4 = xrdb.color4,
    },
    topbar = {
        h = 30,
        w = 30,
        dw = 200,
    },
    commands = {
        terminal = 'urxvt',
        files = 'nautilus',
        browser = 'chrome',
        rofi2 = "rofi -show drun -theme launcher"
    }
};

return config;