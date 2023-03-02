extends Control
var curret_buttons=[]
var ViborID=-1
func ready():
	if len(curret_buttons)==0:
		for i in range(get_child_count()):
			var I = get_child(i)
			curret_buttons.append(I)
func reset():
	ViborID=-1
func HideAll():
	for i in curret_buttons:
		i.hide()
func Show(index,text0):
	curret_buttons[index].show()
	curret_buttons[index].text=text0
	
func Vibor(string_massive):
	ViborID=-1
	HideAll()
	for i in range(len(string_massive)):
		Show(i,string_massive[i])
	#match len(string_massive):
	#	1:
