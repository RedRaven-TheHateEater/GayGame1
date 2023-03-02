extends Sprite

var GUINAME = "Уехать в Подольск"
var LocMinDist = 200
var LocMaxDist = LocMinDist
var ArrowDist = 100
func UseIt():
	get_tree().quit()
