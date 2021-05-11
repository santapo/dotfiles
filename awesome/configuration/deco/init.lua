local awful = require('awful')
-- local left_panel = require('configuration.deco.left-panel')
local top_panel = require('configuration.deco.top_panel')

local naughty = require('naughty')


-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(
  function(s)
    -- naughty.notify({text = tostring(s.index)})
    if s.index == 1 then
      -- Create the left_panel
      -- s.left_panel = left_panel(s)
      -- Create the Top bar
      s.top_panel = top_panel(s)
    else
      -- Create the Top bar
      s.top_panel = top_panel(s)
    end
    -- local fullscreen = s.selected_tag.fullscreenMode
    -- s.top_panel.visible = not fullscreen
    -- naughty.notify({text = tostring(s.top_panel.visible)})
  end
)

-- 'request::desktop_decoration signal not work'
-- screen.connect_signal(
-- 	'request::desktop_decoration',
-- 	function(s)
-- 		if s.index == 1 then
-- 			-- s.left_panel = left_panel(s)
-- 			s.top_panel = top_panel(s, false)
--       local fullscreen = s.selected_tag.fullscreenMode
--       s.top_panel.visible = not fullscreen

-- 		else
-- 			s.top_panel = top_panel(s, false)
-- 		end
-- 		-- s.right_panel = right_panel(s)
-- 		-- s.right_panel_show_again = false
-- 	end
-- )

-- Hide bars when app go fullscreen
function updateBarsVisibility()
  for s in screen do
    if s.top_panel == nil then 
      s.top_panel = top_panel(s)
    end
    
    if s.selected_tag then
      local fullscreen = s.selected_tag.fullscreenMode
      -- Order matter here for shadow
      s.top_panel.visible = not fullscreen
      -- naughty.notify({text = tostring(s.index)})
      -- if s.left_panel then
      --   s.left_panel.visible = not fullscreen
      -- end
    end
  end
end

tag.connect_signal('property::selected',
  function(t)
    updateBarsVisibility()
  end
)

client.connect_signal('property::fullscreen',
  function(c)
    if c.first_tag then
      c.first_tag.fullscreenMode = c.fullscreen
    end
    updateBarsVisibility()
  end
)

client.connect_signal('unmanage',
  function(c)
    if c.fullscreen then
      c.screen.selected_tag.fullscreenMode = false
      updateBarsVisibility()
    end
  end
)
