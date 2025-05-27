extends Node


const MOD_DIR  := "lowlevel1989-AmbidextroAchievements"
const LOG_NAME := "lowlevel1989-AmbidextroAchievements:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

const PATCH_FILES := [
	"scenes/main/menu_loader.gd",
	"scenes/main_menu/settings_menu/video_menu/video_menu.gd",
	"scenes/main_menu/main_menu.gd",
	"scenes/main/save_load.gd"
]

func _init() -> void:
	ModLoaderLog.info("Init", LOG_NAME)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	
	if not FileAccess.file_exists("user://user.bin"):
		var uuid = OS.get_unique_id()
		var file = FileAccess.open("user://user.bin", FileAccess.WRITE)
		file.store_line(uuid)
		file.close()
	
	ModLoaderLog.info("Ambidextro v%s %s" % [Global.version, Global.years], LOG_NAME)
	ModLoaderLog.info("Ambidextro steam version %s" % Global.steam, LOG_NAME)
	
	# disable steam
	Global.steam = false
	
	ModLoaderLog.info("Ambidextro set steam version = %s" % Global.steam, LOG_NAME)
	
	# Add extensions
	install_script_extensions()

func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	
	for gd in PATCH_FILES:
		ModLoaderMod.install_script_extension(
			extensions_dir_path.path_join(gd))
