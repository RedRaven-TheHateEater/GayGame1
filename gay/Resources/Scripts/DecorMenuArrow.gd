extends Sprite

#var Scalc = transform.get_scale()/texture.get_size()
var Scalc = transform.get_scale()/Vector2(120,120)
func _process(delta):
	look_at(get_global_mouse_position())
	rotation_degrees-=90
	scale=Scalc*(position+get_parent().get_transform().origin).distance_to(get_global_mouse_position())

