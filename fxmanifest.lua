rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'
fx_version 'cerulean'
game 'rdr3'

description 'nexus-camera'

author 'justclownfish'
version '0.0.1'

dependencies {
    'oxmysql',
    'ox_lib',
    'rsg-core',
}

shared_script {
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

