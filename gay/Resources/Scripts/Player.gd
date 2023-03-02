extends KinematicBody2D
const Lib = preload("res://Resources/Scripts/lib.gd")
var sas = Vector2() # The player's movement vector.
var PlayerCamera

var OrigPos
var enerc
var CanJump
var Speed = 3
var KOEF_Z=0.8


func _ready():
	PlayerCamera = Lib.GetNodeByName("Camera2",get_parent().get_parent())
	
	OrigPos = Vector3(position.x,0,position.y*KOEF_Z)
	enerc = Vector3(0,0,0)
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
	if Input.is_action_pressed("Jump") and CanJump:
		enerc.y+=20
	
	if Input.is_action_pressed("ui_right"):
		enerc.x+=Speed-enerc.x
	elif Input.is_action_pressed("ui_left"):
		enerc.x-=Speed+enerc.x
	if Input.is_action_pressed("ui_down") :
		enerc.z+=Speed-enerc.z
	elif Input.is_action_pressed("ui_up") :
		enerc.z-=Speed+enerc.z

	OrigPos+=enerc
	position = Vec3ToVec2(OrigPos)
	PlayerCamera.SetPos(position)
	if(abs(enerc.x)>0 and CanJump):
		enerc.x-=Znak(enerc.x)
		
	if(abs(enerc.z)>0 and CanJump):
		enerc.z-=Znak(enerc.z)
	
	if(OrigPos.y>0):
		enerc.y-=1
		CanJump=false
	else:
		CanJump=true
		enerc.y=0-OrigPos.y
	
	
	#move_and_collide(sas)
	if transform.origin.y<500:
		sas.y+=1
	else:
		if sas.y>0:
			sas.y=0
	#move_and_collide(sas)

	#хороший извращенец - мёртвый извращенец



func Vec3ToVec2(Vec3):
	return Vector2(Vec3.x,-Vec3.y+(Vec3.z*KOEF_Z))
func Teleport(Vector3Pos,camreset):
	if camreset:
		OrigPos += Vector3Pos
		position = Vec3ToVec2(OrigPos)
		PlayerCamera.position = position
	else:
		var NEWpos = Vec3ToVec2(Vector3Pos)
		OrigPos = Vector3Pos
		PlayerCamera.position = PlayerCamera.position-position+NEWpos
		position = NEWpos
func TeleportMove(Vector3Pos,camreset):
	if camreset:
		OrigPos += Vector3Pos
		position = Vec3ToVec2(OrigPos)
		PlayerCamera.position = position
	else:
		var NEWpos = Vec3ToVec2(Vector3Pos)
		OrigPos += Vector3Pos
		PlayerCamera.position=PlayerCamera.position  + NEWpos
		position += NEWpos

		

	
