local awful = require('awful')
local menubar = require('menubar')
local beautiful = require('beautiful')
local wibox = require('wibox')


local TagList = require('widgets.tag-list')
local TaskList = require('widgets.task-list')

terminal = "urxvt"

mymainmenu = awful.menu({ items = {
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

menubar.utils.terminal = terminal

mykeyboardlayout = awful.widget.keyboardlayout()

mytextclock = wibox.widget.textclock()

local TopPanel = function(s)
  local panel = awful.wibar({ position = "top", screen = s })
  
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(awful.util.table.join(
                          awful.button({ }, 1, function () awful.layout.inc( 1) end),
                          awful.button({ }, 3, function () awful.layout.inc(-1) end),
                          awful.button({ }, 4, function () awful.layout.inc( 1) end),
                          awful.button({ }, 5, function () awful.layout.inc(-1) end)))

  panel:setup{
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        TagList(s),
        s.mypromptbox,
    },
    TaskList(s), -- Middle widget
    { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        mykeyboardlayout,
        wibox.widget.systray(),
        mytextclock,
        s.mylayoutbox,
    },
  }

  return panel
end

return TopPanel
