extends Sprite
const Lib = preload("res://Resources/Scripts/lib.gd")
var GUINAME = "Поговорить со своей шизофренией"
var LocMinDist = 100
var LocMaxDist = LocMinDist
var ArrowDist = 60
###############################
var DialogController
var lol = 1
var ThisViborID = -1
var FirstDialog = true

func _ready():
	DialogController = Lib.GetNodeByName("DialogController",get_parent().get_parent())
func UseIt():
	DialogController.Start()
	if FirstDialog:
		FirstDialog=false
		
	#DialogController.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		DialogThisObj(lol)
func DialogThisObj(int_dialogindex):
		match int_dialogindex:
			1:
				DialogController.Dialog("Диалог с аней",2)
				lol=lol+1
			2:
				DialogController.Dialog("1",3)
				
		
	
