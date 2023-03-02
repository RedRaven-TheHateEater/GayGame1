extends Node2D

const Lib = preload("res://Resources/Scripts/lib.gd")

var Obj
var player
var selected


func _ready():
	Obj = preload("res://Resources/Controllers/UseableItems/UseableItemsObj.tscn").instance()
	Lib.ForceAddChild(get_parent(),Obj)
	Obj.ready()
	
	
	player = Lib.GetNodeByName("PlayerController",get_parent()).get_child(0)

	
func _process(delta):
	if selected == null:
		for i in range(get_child_count()):
			
			var i_obj = get_child(i)
			var i_pos =i_obj.position
			if(i_pos.distance_to(player.position)<i_obj.LocMinDist):
				Obj.SetPos( ((player.position - i_pos)/(player.position.distance_to(i_pos)/i_obj.ArrowDist))+i_pos)
				Obj.ArrowRotate(i_pos-(Obj.ArrowGetPos()+player.position)/2)
				Obj.SetText(i_obj.GUINAME)
				Obj.TextSetSize(Vector2(i_obj.GUINAME.length()*32,50))
				selected = i_obj
				
	elif selected.position.distance_to(player.position)>selected.LocMaxDist:
		selected = null
		Obj.SetPos(Vector2(0,-INF))

	else:
		if Input.is_action_just_pressed("USE"):
			selected.UseIt()
		var need_pos = ((player.position - selected.position)/(player.position.distance_to(selected.position)/(selected.ArrowDist)))+selected.position
		Obj.AddPos((need_pos-Obj.ArrowGetPos())/20)
		Obj.ArrowRotate(selected.position-(Obj.ArrowGetPos()+player.position)/2)
		
		

