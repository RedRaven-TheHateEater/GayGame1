extends TextureButton


var time = 0
func _process(delta):
	time+=delta
	if time > 0.003:
		rot+=0.1
		time = 0
	
