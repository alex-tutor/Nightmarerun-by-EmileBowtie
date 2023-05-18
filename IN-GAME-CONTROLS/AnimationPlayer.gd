extends AnimationPlayer



func _ready():
	var emmiting_node = get_tree().get_root().find_node("KinematicBody2D",true,false)
	emmiting_node.connect("test_one",self,"test_one_handle2")
	pass 

func test_one_handle2():
	play("GOT-appear-anim")
