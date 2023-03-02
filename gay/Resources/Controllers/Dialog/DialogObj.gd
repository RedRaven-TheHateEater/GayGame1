extends Control

var Text
const Lib = preload("res://Resources/Scripts/lib.gd")

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

func DialogText(text0,speed0):
	work=true
	NeedText=text0
	CurretText=text0
	SetText("")
	speedText=speed0
	SetPos(position)
	tryaska=false
	TextKof=100/float(len(text0))
	TextPercent=0

func DialogTextTr(text0,speed0,speed_tryaska,stepen_tryaski0):
	DialogText(text0,speed0)
	speedTryas=speed_tryaska
	stepen_tryaski=stepen_tryaski0
	tryaska=true
func DialogClear():
	tryaska=false
	NeedText=""
	CurretText=""
	SetText("")
	SetPos(position)
	TextPercent=100
	







################
func _process(delta):
	if work:
		Writing(delta)
	if tryaska:
		Tryasti(delta)
func Writing(delta):
	if NeedText.length()>0:
		time1+=delta
		if time1 > speedText:
			time1 = 0
			if NeedText[0] ==" ":
				time1=speedText
			AddText(NeedText[0])
			NeedText=NeedText.substr(1)
			TextPercent+=TextKof
	else:
		work = false
func Tryasti(delta):
	time2+=delta
	if time2 > speedTryas:
		time2 = 0
		SetPos(position+Vector2(rand_range(-stepen_tryaski,stepen_tryaski),rand_range(-stepen_tryaski,stepen_tryaski)))
		
func ready(CamSize):
	Text = get_children()[0]
	var Size = GetSize()
	position=Vector2(-Size.x/2,CamSize.y/2-Size.y)
	SetPos(position)
	hide()


func SetPos(Vector20):
	Text.set_position(Vector20)
func GetSize():
	return Text.get_size()
func SetText(string0):
	Text.text=string0
func AddText(string0):
	Text.text+=string0
