extends Button

const Lib = preload("res://funcs.gd")
func _pressed():
	Lib.Save_String("lol.txt","Мой дом!")
