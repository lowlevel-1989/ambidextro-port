extends "res://scenes/main/save_load.gd"

var uuid = null

func _ready():
	_save_data = SaveData.new()
	
	if FileAccess.file_exists("user://user.bin"):
		var file = FileAccess.open("user://user.bin", FileAccess.READ)
		uuid = file.get_line()
		file.close()
	super()

func save_data(value_name: String, value):
	_save_data.data[value_name] = value
	
	var file = FileAccess.open_encrypted_with_pass(
			"user://data.bin", FileAccess.WRITE, uuid)
	if not file:
		print("Error saving: ",
			FileAccess.get_open_error(),". Path: user://data.bin")
		return

	file.store_string(JSON.stringify(_save_data.data))
	file.close()

func load_data():
	if FileAccess.file_exists("user://data.bin"):
		create_default_data()
		load_settings()
		var file = FileAccess.open_encrypted_with_pass(
			"user://data.bin", FileAccess.READ, uuid)
		if file:
			var data = JSON.parse_string(file.get_as_text())
			_save_data = SaveData.new()
			_save_data.data = data
			file.close()
	else:
		return super()
