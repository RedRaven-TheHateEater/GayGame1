extends Sprite

const Lib = preload("res://Resources/Scripts/lib.gd")
var GUINAME = "В Саратов"
var LocMinDist = 200
var LocMaxDist = LocMinDist
var ArrowDist = 100
func UseIt():
	print("да")
	print("нет")
	var player = Lib.GetNodeByName("Player",get_parent().get_parent())
	player.TeleportMove(Vector3(-2000,0,0),Lib.FileRead("Saves/Settings")[1])
