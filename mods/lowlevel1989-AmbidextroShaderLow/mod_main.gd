extends Node


const MOD_DIR := "lowlevel1989-AmbidextroShaderLow"
const LOG_NAME := "lowlevel1989-AmbidextroShaderLow:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""


func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	extensions_dir_path = mod_dir_path.path_join("extensions")

	ModLoaderLog.info("Init", LOG_NAME)

	ModLoaderMod.install_script_extension(
		extensions_dir_path.path_join("scenes/main/fps_counter.gd"))

	var oshader = preload("res://shaders/CRT2/crt_material2.tres")
	oshader.shader = preload("res://mods-unpacked/lowlevel1989-AmbidextroShaderLow/crt.gdshader")
