extends Camera2D

const Lib = preload("res://Resources/Scripts/lib.gd")

var MosPos
var plov
	
func _enter_tree():
	MosPos= get_global_mouse_position()/2-position
	plov = Lib.FileRead("Saves/Settings")[2]/100
	
	
func SetPos(Pos):
	if position.y<0:
		print("АААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААА")
	if get_global_mouse_position().distance_to(position)<900:
		MosPos= (get_global_mouse_position()-position)/2
	position += (Pos+MosPos-position)/(1+40*plov)
