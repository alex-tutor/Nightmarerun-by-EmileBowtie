extends Area2D



func _ready():
	pass # Replace with function body.

func _on_RopeStage2Check_body_entered(body):
	if body.has_method("died"):
		body.died()
	pass
