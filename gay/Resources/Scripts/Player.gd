extends KinematicBody2D
const Lib = preload("res://Resources/Scripts/lib.gd")
var sas = Vector2() # The player's movement vector.
var PlayerCamera

var enerc
var Speed = 3
var KOEF_Z=0.8
var PlayerSprite


func _ready():
	PlayerSprite = get_child(0)
	PlayerCamera = Lib.GetNodeByName("Camera2",get_parent().get_parent())
	enerc = Vector2(0,0)
	PlayerCamera.position=position




func Znak(chislo):
	if not chislo == 0:	
		return chislo/abs(chislo)
	else:
		return 0




func _process(delta):
	if Input.is_key_pressed(KEY_SHIFT):
		Speed=8
	else:
		Speed=3
	if Input.is_action_pressed("Jump"):
		enerc.y+=20

	if Input.is_action_pressed("ui_right"):
		enerc.x+=Speed-enerc.x
		scale = Vector2(-1,1)
	elif Input.is_action_pressed("ui_left"):
		enerc.x-=Speed+enerc.x
		scale = Vector2(1,1)
	if Input.is_action_pressed("ui_down") :
		enerc.y+=Speed-enerc.y
	elif Input.is_action_pressed("ui_up") :
		enerc.y-=Speed+enerc.y
	
	position+=enerc
	PlayerCamera.SetPos(position)
	if(abs(enerc.x)>0):
		enerc.x-=Znak(enerc.x)
		PlayerSprite.playing = true
	else: 
		PlayerSprite.playing = false
	if(abs(enerc.y)>0):
		enerc.y-=Znak(enerc.y)

	
	
	#move_and_collide(sas)
	if transform.origin.y<500:
		sas.y+=1
	else:
		if sas.y>0:
			sas.y=0
	#move_and_collide(sas)

	#хороший извращенец - мёртвый извращенец

	if Input.is_action_pressed("test_button"):
		position = Vector2(2,0)
		PlayerCamera.position = position


func Teleport(Vector3Pos,camreset):
	if camreset:
		position += Vector3Pos
		PlayerCamera.position = position
	

	
