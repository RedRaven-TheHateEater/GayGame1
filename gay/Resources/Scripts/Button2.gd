extends Button

const Lib = preload("res://Scripts/lib.gd")
func _pressed():
	print(Lib.Load("lol.txt"))
