extends "res://scenes/main/menu_loader.gd"

var __achievements = preload("res://mods-unpacked/lowlevel1989-AmbidextroAchievements/extensions/scenes/main_menu/achievements_menu/achievements_menu.tscn")

func load_achievements_menu():
	load_scene(__achievements)
	_current_menu_instance.menu_loader = self
	menu_container.add_child(_current_menu_instance)
