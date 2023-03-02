extends Sprite

var time = 0
var speed = 0.1
func _process(delta):
	time+=delta
	rotate(speed)
	if time > 0.1:
		if(speed>0.1):
			speed=speed-0.04
		time = 0
	if speed<0.1:
		speed=0.1
	
	
