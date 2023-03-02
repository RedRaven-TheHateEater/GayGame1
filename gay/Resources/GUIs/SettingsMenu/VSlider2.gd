extends VSlider
const Lib = preload("res://Resources/Scripts/lib.gd")
func _process(delta):
	Lib.FileMod("Saves/Settings",2,value)

func _ready():
	value = Lib.FileRead("Saves/Settings")[2]
