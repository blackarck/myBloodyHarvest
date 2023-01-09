extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	body.get_parent().get_parent().remove_child(body.get_parent())
	get_parent().curr_enem_cnt=get_parent().curr_enem_cnt-1
	#increment the score
	get_parent().score=get_parent().score+1
	queue_free()
	
