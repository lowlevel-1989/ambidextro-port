extends "res://scenes/main_menu/main_menu.gd"

var __options
var __container

func _ready():
	__options   = get_node("Options")
	__container = get_node("Options/VBoxContainer")
	
	add_item_achievements()
	super()

func accept_option(option: String, _option_index: int):
	if option == "achievements":
		menu_loader.load_achievements_menu()
	else:
		super(option, _option_index)

func add_item_achievements():
	var item_achievements = __container.get_child(0).duplicate()
	item_achievements.name = "ACHIEVEMENTS"
	item_achievements.text = "ACHIEVEMENTS"
	
	__container.add_child(item_achievements)
	__options.options.append(item_achievements)
	
	var item_exit = __options.options[-2]
	__options.options[-2] = item_achievements
	__options.options[-1] = item_exit
	
	var count = __container.get_child_count()
	if count > 1:
		__container.move_child(item_achievements, count - 2)
