extends Sprite

const Lib = preload("res://Resources/Scripts/lib.gd")
var GUINAME = "В Балашиху"
var LocMinDist = 200
var LocMaxDist = LocMinDist
var ArrowDist = 100
func UseIt():
	print("да")
	print("нет")
	var player = Lib.GetNodeByName("PlayerController",get_parent().get_parent())
	var end_pos = get_node("Position2D").position
	player.Teleport(end_pos)
