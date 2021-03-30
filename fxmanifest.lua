fx_version 'adamant'

game 'gta5'

description 'Shelo Cegla'

version '1.1'

client_scripts {
	'@es_extended/locale.lua',
	'client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'server.lua'
}

dependencies {
	'es_extended',
	'mythic_progbar',
	'pNotify'
}
