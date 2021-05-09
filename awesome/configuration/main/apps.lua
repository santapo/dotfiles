local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. 'utilities/'


return {

    default = {
        -- Default power manager
		power_manager = 'xfce4-power-manager-settings'
    }
}