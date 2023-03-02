extends AudioStreamPlayer
const Lib = preload("res://Resources/Scripts/lib.gd")
func _process(delta):
	volume_db = Lib.FileRead("Saves/Settings")[0]-50
