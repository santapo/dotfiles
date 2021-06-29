local lgi = require ('lgi')
local UP = lgi.require('UPowerGlib')

local devices = UP.Client():get_devices()
for _, d in ipairs(devices) do
  print(d:get_object_path())
end