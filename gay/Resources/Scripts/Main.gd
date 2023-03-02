extends Node
const Lib = preload("res://Resources/Scripts/lib.gd")
func _ready():
	Lib.FileOrFix("Saves/Settings",[int(-50),false,int(100)])
	get_tree().change_scene("res://Resources/ZeroMenu1.tscn")
