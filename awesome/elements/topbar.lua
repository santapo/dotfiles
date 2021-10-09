local awful = require('awful');
local wibox = require('wibox');
local gears = require('gears');
local naughty = require('naughty');
local beautiful = require('beautiful');
local config = require('helpers.config');
local rounded = require('helpers.rounded');
local xrdb = beautiful.xresources.get_current_theme();

root.elements = root.elements or {};

function make_launcher(s)
    local launcher = wibox({
        screen = s,
        type = 'menu',
        visible = false,
        width = config.topbar.w,
        height = config.topbar.h,
    });
    
    launcher:setup {
        layout = wibox.container.margin,
        forced_width = config.topbar.w,
        forced_height = config.topbar.h,
        {
            layout = wibox.container.background,
            bg = config.colors.x4,
            fg = config.colors.w,
            {
                layout = wibox.container.place,
                {
                    widget = wibox.widget.textbox,
                    text = config.icons.arch,
                    font = config.fonts.im,
                }
            }
        }
    }
    
    launcher:struts({ top = config.topbar.h + config.global.m });
    launcher.x = s.workarea.x + config.global.m;
    launcher.y = config.global.m;
    launcher:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.spawn(config.commands.rofi2);
        end)
    ));

    root.elements.laucnher = root.elements.launcher or {};
    root.elements.launcher[s.index] = launcher;
end


return function()
    awful.screen.connect_for_each_screen(function(screen)
        if not root.elements.launcher or not root.elements.launcher[screen.index] then make_launcher(screen) end;
    end);

    root.elements.topbar = {
        show = function()
            for i in pairs(root.elements.launcher) do root.elements.launcher[i].visible = true end;
        end,
        hide = function()
            for i in pairs(root.elements.launcher) do root.elements.launcher[i].visible = false end;
        end
    }
end