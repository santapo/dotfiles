local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. 'utilities/'


return {

    default = {
        -- Default network manager
		network_manager = 'kitty iwctl',
        -- Default power manager
		power_manager = 'xfce4-power-manager-settings'
    },
    
    run_on_start_up = {
        'xfce4-power-manager',
    }
}