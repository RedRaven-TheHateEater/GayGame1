extends Object
static func GetNodeByName(name,parentnode):
	for i in parentnode.get_child_count():
		if name == parentnode.get_child(i).name:
			return parentnode.get_child(i)
static func ForceAddChild(parent,child):
	parent.call_deferred("add_child", child)
static func FileWrite(name,info):
	name = "res://"+name
	var streamer = File.new()
	streamer.open(name,File.WRITE)
	streamer.store_var(info)
	streamer.close()
static func FileRead(name):
	name = "res://"+name
	var streamer = File.new()
	streamer.open(name,File.READ)
	var info = streamer.get_var()
	streamer.close()
	return info
static func FileMod(name,index,value):
	var info=FileRead(name)
	info[index]=value
	FileWrite(name,info)
static func FileMake(name,count):
	var arr = []
	for i in range(count):
		arr.append(null)
	FileWrite(name,arr)
static func FileExists(name):
	var streamer = File.new()
	var boo = streamer.file_exists(name)
	return boo
static func FileOrFix(name,var0):
	if(not FileExists(name)):
		FileWrite(name,var0)
