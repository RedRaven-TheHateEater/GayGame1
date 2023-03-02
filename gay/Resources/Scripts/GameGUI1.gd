extends Control
var PauseMenu = preload("res://GamePause1.tscn").instance()
var paused = false
func _input(event):
	if event.is_action_pressed("Escape"):
		if not paused:
			get_tree().get_root().get_child(0).add_child(PauseMenu)
			paused=true
		else:
			paused = false
			get_tree().get_root().get_child(0).remove_child(PauseMenu)

var OLD_SIZE = Vector2(0,0)
func _ready():
	OLD_SIZE = get_viewport_rect().size
	get_tree().get_root().connect("size_changed", self, "SizeChanged")

func SizeChanged():
	PauseMenu.rect_scale = get_viewport_rect().size/OLD_SIZE
