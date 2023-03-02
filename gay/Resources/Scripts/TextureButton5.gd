extends TextureButton
func _pressed():
	var new_event =InputEventAction.new()
	new_event.action = "Escape"
	new_event.pressed = true
	Input.parse_input_event(new_event)
