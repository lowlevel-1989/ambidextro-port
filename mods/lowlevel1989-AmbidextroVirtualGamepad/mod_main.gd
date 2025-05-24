extends Node

const MOD_DIR := "lowlevel1989-AmbidextroVirtualGamepad"
const LOG_NAME := "lowlevel1989-AmbidextroVirtualGamepad:Main"

var mod_dir_path := ""
var extensions_dir_path := ""

func _init() -> void:
	ModLoaderLog.info("Init", LOG_NAME)

	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_extension(
		extensions_dir_path.path_join("scenes/levels/tutorial.gd"))
	
	ModLoaderMod.install_script_extension(
		extensions_dir_path.path_join("scenes/main/level_loader.gd"))
		
	ModLoaderMod.install_script_extension(
		extensions_dir_path.path_join("scenes/main_menu/main_menu_options.gd"))
	
	
func _ready() -> void:
	Input.joy_connection_changed.connect(on_joy_connection_changed)
	
	ModLoaderLog.info(
		"SDL_GAMECONTROLLERCONFIG = %s" % OS.get_environment("SDL_GAMECONTROLLERCONFIG"), LOG_NAME)

func patch_sdl_guid(device_id):
	var config = OS.get_environment("SDL_GAMECONTROLLERCONFIG")
	if not config:
		return

	var guid = Input.get_joy_guid(device_id)
	var comma_index = config.find(",")

	var config_without_guid = config.substr(comma_index)
	
	var mapping = guid + config_without_guid

	print(mapping)
	# FIXED: mapping
	Input.add_joy_mapping(mapping, true)
	
	ModLoaderLog.info("APPLY MAPPING", LOG_NAME)

func on_joy_connection_changed(device_id, is_connected):
	print("DEVICE ID: ", device_id, " is_connected ", is_connected)
	print(Input.get_joy_guid(device_id))
	print(Input.get_joy_info(device_id))
	
	patch_sdl_guid(device_id)
