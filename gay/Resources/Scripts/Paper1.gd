extends Sprite

var time = 0
var speed = 0
func _process(delta):
	time+=delta
	if time > 0.003:
		rotate(0.01)
		time = 0
	if speed<360:
		speed+=1.5
	else:
		speed=0
	position+=Vector2(0,sin(PI*speed/180))
	
