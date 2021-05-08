-- Standard awesome library
local gears = require("gears")
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
-- -- screen.connect_signal("request::wallpaper", set_wallpaper(s))

-- screen.connect_signal(
-- 	'request::wallpaper',
-- 	function(s)
-- 		-- If wallpaper is a function, call it with the screen
-- 		if beautiful.wallpaper then
-- 			if type(beautiful.wallpaper) == 'string' then

-- 				-- Check if beautiful.wallpaper is color/image
-- 				if beautiful.wallpaper:sub(1, #'#') == '#' then
-- 					-- If beautiful.wallpaper is color
-- 					gears.wallpaper.set(beautiful.wallpaper)

-- 				elseif beautiful.wallpaper:sub(1, #'/') == '/' then
-- 					-- If beautiful.wallpaper is path/image
-- 					gears.wallpaper.maximized(beautiful.wallpaper, s)
-- 				end
-- 			else
-- 				beautiful.wallpaper(s)
-- 			end
-- 		end
-- 	end
-- )