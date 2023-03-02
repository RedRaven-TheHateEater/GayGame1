extends Control

var MainMenu = preload("res://Resources/GUIs/MainMenu/MainMenu1.tscn").instance()
var SavesMenu = preload("res://Resources/Locations/Test1/Map_Test1.tscn").instance()
var SettingsMenu = preload("res://Resources/GUIs/SettingsMenu/SettingsMenu1.tscn").instance()
var CreditsMenu = preload("res://Resources/GUIs/CreditsMenu/CreditsMenu1.tscn").instance()
var AchievementsMenu = preload("res://Resources/GUIs/AchievementsMenu/AchievementsMenu1.tscn").instance()
var Menus = [MainMenu,SavesMenu,SettingsMenu,CreditsMenu,AchievementsMenu]

func _ready():
	ChangeMenu(0)

func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		ChangeMenu(0)
func RemoveAll():
	for i in Menus:
		remove_child(i)



func ChangeMenu(number):
	if(number==0):
		RemoveAll()
		add_child(MainMenu)
	elif(number==1):
		RemoveAll()
		add_child(SavesMenu)
	elif(number==2):
		RemoveAll()
		add_child(AchievementsMenu)
	elif(number==3):
		RemoveAll()
		add_child(SettingsMenu)
	elif(number==4):
		RemoveAll()
		add_child(CreditsMenu)
		
