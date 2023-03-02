extends Node2D

var PauseMenu = preload("res://Resources/GUIs/GamePause1.tscn").instance()
var paused = false
func _input(event):
	if event.is_action_pressed("Escape"):
		if not paused:
			get_tree().get_root().get_child(0).add_child(PauseMenu)
			var Size = get_viewport_rect().size
			PauseMenu.set_begin(Vector2(0,0))
			PauseMenu.set_end(get_viewport_rect().size)
			paused=true
		else:
			paused = false
			get_tree().get_root().get_child(0).remove_child(PauseMenu)

func _ready():
	get_tree().get_root().connect("size_changed", self, "SizeChanged")

func SizeChanged():
	PauseMenu.set_end(get_viewport_rect().size)
