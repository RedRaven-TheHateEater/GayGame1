extends Sprite

var time = 0
func _process(delta):
	time+=delta
	if time > 0.003:
		rotate(-0.05)
		time = 0
	
