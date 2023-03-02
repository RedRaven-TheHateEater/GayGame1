extends Node
const Lib = preload("res://Resources/Scripts/lib.gd")




var Vibor = preload("res://Resources/Controllers/Dialog/Vibori.tscn").instance()
var Obj = preload("res://Resources/Controllers/Dialog/DialogObj.tscn").instance()

func _ready():
	Obj.ready(get_viewport().size)
	Lib.ForceAddChild(Lib.GetNodeByName("Camera2",get_parent()),Obj)
	Vibor.ready()
	






func Start():
	Obj.show()
	print("начало диалога")
func End():
	Obj.hide()
	print("закончить диалог")


func ViborOn(string_massive):
	Lib.ForceAddChild(Obj,Vibor)
	Vibor.Vibor(string_massive)
func ViborOff():
	Obj.remove_child(Vibor)
	Vibor.reset()
	


func Dialog(string_name,int_dialogindex):
	var ThisDialog = []
	for i in get_children():
		if i.name==string_name:
			ThisDialog=i.Dialog(int_dialogindex)
	match len(ThisDialog):
		2:
			Obj.DialogText(ThisDialog[0],ThisDialog[1])
		3:
			Obj.DialogText(ThisDialog[0],ThisDialog[1])
			ViborOn(ThisDialog[2])
		4:
			Obj.DialogTextTr(ThisDialog[0],ThisDialog[1],ThisDialog[2],ThisDialog[3])
		5:
			Obj.DialogTextTr(ThisDialog[0],ThisDialog[1],ThisDialog[3],ThisDialog[4])
			ViborOn(ThisDialog[2])
		
