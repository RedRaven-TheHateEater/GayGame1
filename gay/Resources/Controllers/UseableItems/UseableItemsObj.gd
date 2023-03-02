extends Control

const Lib = preload("res://Resources/Scripts/lib.gd")

var Arrow 
var Text

func ready():
	Arrow = get_children()[0]
	Text = get_children()[1]
func SetPos(Vector20):
	Arrow.position = Vector20
	Text.set_position(Arrow.position + Vector2(0,-64))
func AddPos(Vector20):
	SetPos(Arrow.position+Vector20)
func ArrowGetPos():
	return Arrow.position
func ArrowRotate(angle):
	Arrow.rotation=angle.angle()+1.5*PI
func SetText(string0):
	Text.text=string0
func TextSetSize(Vector20):
	Text.set_size(Vector20)
