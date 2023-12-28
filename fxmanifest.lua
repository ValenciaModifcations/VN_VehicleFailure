fx_version 'cerulean'
game 'gta5'

description 'VN-VehicleFailure, designed for ND_Core framework.'

version '1.0.0'

client_script 'client/client.lua'

server_script 'server/server.lua'

shared_scripts {
    "config.lua",
    '@ox_lib/init.lua',
    "@ND_Core/init.lua"
}

lua54 'yes'