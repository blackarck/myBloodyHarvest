extends KinematicBody2D

 
var velocity1 = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	 
	#get the player's posirion based on that shoot
	var posy=get_parent().position.y
	 
	if(posy < 100):
		#top to bottom
		velocity1.y = 500
	elif(posy > 400):
		#bottom to top
		velocity1.y = -500
		
func _physics_process(delta):
	move_and_slide(velocity1)
