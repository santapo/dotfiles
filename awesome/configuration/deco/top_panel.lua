local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local dpi = beautiful.xresources.apply_dpi

local deco = {
    wallpaper = require("configuration.deco.wallpaper"),
    taglist   = require("configuration.deco.taglist"),
    tasklist  = require("configuration.deco.tasklist")
}
  
local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

-- local _M = {}

mytextclock = wibox.widget.textclock()

local top_panel = function(s)

    local panel = wibox{
        ontop = true,
        screen = s,
        type = 'dock',
        height = dpi(25),
        width = s.geometry.width,
        x = s.geometry.x,
        y = s.geometry.y,
        stretch = false,
        -- bg = beautiful.background,
        -- fg = beautiful.fg_normal
    }

    panel:struts{ top = dpi(30) }

    panel:connect_signal('mouse::enter', function()
        local w = mouse.current_wibox
        if w then
            w.cursor = 'left_ptr'
        end
    end)



    -- set_wallpaper(s)

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }
    s.mypromptbox = awful.widget.prompt()
    s.battery = require('widget.battery')()
    s.network = require('widget.network')()


    panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            RC.launcher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            s.battery,
            s.network,
            mytextclock,
            s.mylayoutbox,
        },
    }

    return panel
end

return top_panel