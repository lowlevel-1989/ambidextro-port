extends "res://scenes/main/menu_loader.gd"

var __achievements = preload("res://mods-unpacked/lowlevel1989-AmbidextroAchievements/extensions/scenes/main_menu/achievements_menu/achievements_menu.tscn")

func load_achievements_menu():
	load_scene(__achievements)
	_current_menu_instance.menu_loader = self
	_current_menu_instance.level_previews = level_previews
	_current_menu_instance.ui_sounds = ui_sounds
	_current_menu_instance.level_list = level_loader.level_list
	if save_load.is_last_level_unlocked(): _current_menu_instance.unlock_last_level()
	_current_menu_instance.initialize.call_deferred()
	menu_container.add_child(_current_menu_instance)
