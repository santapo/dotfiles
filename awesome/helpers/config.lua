local beautiful = require('beautiful');
local xrdb = beautiful.xresources.get_current_theme();

local config = {
    global = {
        m = 10,
        r = 7,

    },
    fonts = {
        im = "Material Design Icons Desktop 14",
        tll = "SF Pro Display Light 12",
        tlb = "SF Pro Display Semibold 12",
    },
    icons = {
        arch = '󰣇',
        date = '󰸘',
        time = '󰅐',
    },
    colors = {
        t = '#00000000',
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