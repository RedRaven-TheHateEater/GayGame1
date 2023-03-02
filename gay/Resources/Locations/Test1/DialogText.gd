extends TextEdit
var time1 = 0
var time2 = 0
var speedText
var speedTryas
var NeedText=""
var CurretText=""
var work = false
var tryaska = false
var position
var stepen_tryaski
var TextPercent = 0
var TextKof = 0

var Vibor = preload("res://Resources/GUIs/Vibori.tscn").instance()

func _ready():
	var CamSize = get_viewport().size
	var Size = get_size()
	position=Vector2(-Size.x/2,CamSize.y/2-Size.y)
	set_position(position)
	hide()


func _process(delta):
	if work:
		if NeedText.length()>0:
			time1+=delta
			if time1 > speedText:
				time1 = 0
				if NeedText[0] ==" ":
					time1=speedText
				text+=NeedText[0]
				NeedText=NeedText.substr(1)
				TextPercent+=TextKof
		else:
			work = false
	if tryaska:
		time2+=delta
		if time2 > speedTryas:
			time2 = 0
			set_position(position+Vector2(rand_range(-stepen_tryaski,stepen_tryaski),rand_range(-stepen_tryaski,stepen_tryaski)))
		



func Start():
	show()
	print("начало диалога")
func End():
	hide()
	print("закончить диалог")
func Text(text0,speed0):
	work=true
	NeedText=text0
	CurretText=text0
	text=""
	speedText=speed0
	set_position(position)
	tryaska=false
	TextKof=100/float(len(text0))
	TextPercent=0
func TextClear():
	tryaska=false
	NeedText=""
	CurretText=""
	text=""
	set_position(position)
	TextPercent=100
	
	
func TextTr(text0,speed0,speed_tryaska,stepen_tryaski0):
	Text(text0,speed0)
	speedTryas=speed_tryaska
	stepen_tryaski=stepen_tryaski0
	tryaska=true

func ViborOn(string_massive):
	add_child(Vibor)
	Vibor.Vibor(string_massive)
func ViborOff():
	remove_child(Vibor)
