extends CheckBox
const Lib = preload("res://Resources/Scripts/lib.gd")
func _process(delta):
	Lib.FileMod("Saves/Settings",1,pressed)

func _ready():
	pressed = Lib.FileRead("Saves/Settings")[1]
