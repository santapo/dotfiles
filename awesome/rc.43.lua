-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

local beautiful = require("beautiful")
local menubar = require("menubar")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")


RC = {} -- global namespace, on top before require any modules
RC.vars = require("configuration.main.user-variables")

-- {{{ Error handling -- }}}
require("configuration.main.error-handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.wallpaper = RC.vars.wallpaper
-- }}}

modkey = RC.vars.modkey

-- Custom Local Library
local main = {
    layouts = require("configuration.main.layouts"),
    tags    = require("configuration.main.tags"),
    menu    = require("configuration.main.menu"),
    rules   = require("configuration.main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
local binding = {
    globalbuttons = require("configuration.bindings.globalbuttons"),
    clientbuttons = require("configuration.bindings.clientbuttons"),
    globalkeys    = require("configuration.bindings.globalkeys"),
    bindtotags    = require("configuration.bindings.bindtotags"),
    clientkeys    = require("configuration.bindings.clientkeys")
}
  

-- {{{ Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
-- a variable needed in main.tags, and statusbar
-- awful.layout.layouts = { ... }
RC.layouts = main.layouts()
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
-- a variable needed in rules, tasklist, and globalkeys
RC.tags = main.tags()
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys

-- a variable needed in statusbar (helper)
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)

-- Menubar configuration
-- Set the terminal for applications that require it
menubar.utils.terminal = RC.vars.terminal

-- }}}

-- {{{ Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()



-- {{{ Statusbar: Wibar
require("configuration.deco.statusbar")
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)
-- }}}

-- {{{ Signals
require("configuration.main.signals")
-- }}}
