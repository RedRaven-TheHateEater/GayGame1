extends Sprite

var speed = 180
func _process(delta):
	if speed<360:
		speed+=1
	else:
		speed=0
	position+=Vector2(0,sin(PI*speed/180))
	
