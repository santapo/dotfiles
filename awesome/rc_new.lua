local os = require('os');
local gears = require('gears');
local awful = require('awful');
local wibox = require('wibox');
local ruled = require('ruled');
local naughty = require('naughty');
local config = require('helpers.config');
local beautiful = require('beautiful');
require('./errors')();



-- ELEMENT STORE
root.elements = root.elements or {};

-- THEME
beautiful.useless_gap = 5;

-- MODKEY
modkey = 'Mod4';

-- LAYOUTS
tag.connect_signal('request::default_layouts', function()
        awful.layout.append_default_layouts({
            awful.layout.suit.tile,
            awful.layout.suit.spiral.dwindle,
            awful.layout.suit.floating
        });
end);

-- TAGS/LAYOUTS
screen.connect_signal('request::desktop_decoration', function(s)
        if s.index == 1 then
            awful.tag({1,2,3}, s, awful.layout.layouts[1]);
        else
            awful.tag({4,5,6}, s, awful.layout.layouts[1]);
        end
        s.tags[1]:view_only();
end);

-- GLOBAL KEYBINDS/BUTTONS
awful.keyboard.append_global_keybindings({
        awful.key({ modkey }, "Return", function() awful.spawn(config.commands.terminal) end),
});

for i = 0, 9 do
        local spot = i;
        if(spot == 10) then spot = 0 end

	awful.keyboard.append_global_keybindings({
		awful.key({ modkey }, spot, function()
			local tag = root.tags()[i];
			if tag then tag:view_only() end;
		end),
		awful.key({ modkey, 'Control' }, spot, function()
			local tag = root.tags()[i];
			if tag and client.focus then client.focus:move_to_tag(tag) end;
		end)
	});
end

-- CLIENT KEYBINDS/BUTTONS
client.connect_signal("request::default_keybindings", function(c)
        awful.keyboard.append_global_keybindings({
                awful.key({ modkey }, "q", function(c) c.kill(c) end),
        }); 
end);

client.connect_signal("request::default_mousebindings", function(c)
	awful.mouse.append_client_mousebindings({
		-- awful.button({}, 1, function(c)
		-- 	if root.elements.hub then root.elements.hub.close() end
		-- 	c:active { context = 'mouse_click', raise = true }
		-- end),
		awful.button({ modkey }, 1, function(c)
			c.floating = true;
			c:active { context = 'mouse_click', action = "mouse_move" }
		end),
		awful.button({ modkey }, 3, function(c)
			c:active { context = 'mouse_click', action = "mouse_resize" }
		end),
	});
	
end);

-- SPAWNS
awful.spawn.with_shell("$HOME/.config/awesome/scripts/screen.sh");
awful.spawn.with_shell("$HOME/.config/awesome/scripts/wallpaper.sh");
-- awful.spawn.with_shell("$HOME/.config/awesome/scripts/compositor.sh");

-- ELEMENTS
if not root.elements.topbar then require('elements.topbar')() end;

os.execute('sleep 0.1');
if root.elements.topbar then root.elements.topbar.show() end;






