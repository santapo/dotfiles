
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi

local battery_text = wibox.widget {
  markup = "<span foreground='" .. "#ff5733" .. "'>" .. string.format("%1d", 100) .. "%" .. "</span>",
  font = beautiful.font,
  align = "center",
  valign = "center",
  widget = wibox.widget.textbox
}

local battery_icon = wibox.widget {
  markup = "<span foreground='" .. "#3c3836" .. "'>" .. "" .. "</span>",
  font = "FiraCode Nerd Font Mono " .. "30",
  align = "center",
  valign = "center",
  widget = wibox.widget.textbox
}

local battery_pill = wibox.widget {
  {
      {battery_icon, top = dpi(5), widget = wibox.container.margin},
      {battery_text, top = dpi(3), widget = wibox.container.margin},
      layout = wibox.layout.fixed.horizontal
  },
  left = dpi(10),
  right = dpi(10),
  bg = "#ff0000:0.5",
  widget = wibox.container.margin
}

-- local make_pill = function(w)
--   local pill = wibox.widget {
--       w,
--       bg = "#ff0000:0.5",
--       widget = wibox.container.background
--   }
--   return pill
-- end

-- local wrap_widget = function(w)
--   local wrapped = wibox.widget {
--       w,
--       top = dpi(5),
--       left = dpi(4),
--       bottom = dpi(5),
--       right = dpi(4),
--       widget = wibox.container.margin
--   }
--   return wrapped
-- end

return battery_pill

