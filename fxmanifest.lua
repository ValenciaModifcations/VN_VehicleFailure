fx_version 'cerulean'
game 'gta5'

description 'VN-VehicleFailure, designed for ND_Core framework.'

version '1.0.0'

server_scripts {
    "server/server.lua",
    "server/function.lua"
}

shared_scripts {
    "config.lua",
    "@ND_Core/init.lua"
}

client_script 'client/client.lua'

lua54 'yes'