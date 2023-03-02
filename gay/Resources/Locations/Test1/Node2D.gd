extends Node

const Lib = preload("res://Resources/Scripts/lib.gd")
var player
var line
func _ready():
	player = Lib.GetNodeByName("Player",get_parent())
	line = Lib.GetNodeByName("UsingArrow",get_parent())
	
func _process(delta):
	if player.selected == null:
		for i in range(get_child_count()):
			var i_obj = get_child(i)
			var i_pos =i_obj.position
			if(i_pos.distance_to(player.position)<i_obj.LocMinDist):
				line.position = ((player.position - i_obj.position)/(player.position.distance_to(i_obj.position)/i_obj.ArrowDist))+i_obj.position
				player.selected = i_obj
				
	elif player.selected.position.distance_to(player.position)>player.selected.LocMaxDist:
		player.selected = null
	else:
		if Input.is_action_just_pressed("USE"):
			player.selected.UseIt()
		
