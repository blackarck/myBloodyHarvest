extends Sprite

#player movement
#y=35, y=570
#post1= 170
#post2=260
#pos3=460
#pos4=550
#pos5=750
#pos6=840
# *******
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var xarray=[170,260,460,550,750,840]
var arraycnt=0
var shootAllowed=true
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x=170
	position.y=35
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	 
	if (Input.is_action_pressed("ui_up")):
		if(position.y != 35):
				position.y=35
				texture=load("res://images/player_01.png") 
	if (Input.is_action_pressed("ui_down")):
		if(position.y != 570):
			position.y=570
			texture=load("res://images/player_02.png") 
			
	if (Input.is_action_just_released("ui_left")):
		if(arraycnt != 0):
			arraycnt=arraycnt-1
			position.x=xarray[arraycnt]

	if (Input.is_action_just_released("ui_right")):
		if(arraycnt != 5):
			arraycnt=arraycnt+1
			position.x=xarray[arraycnt] 
			
			
	if (Input.is_key_pressed(KEY_F)):
		var fps = 1.0 / delta
		print("FPS: %d" % fps)
		
	if (Input.is_action_just_released("ui_shoot")):
		if(shootAllowed):
			shootAllowed=false
			var projectile = load("res://bullet.tscn")
			var bullet = projectile.instance()
			 
			bullet.position.x=position.x
			bullet.position.y=position.y
		 
			add_child(bullet)
			bullet.set_as_toplevel(true)
			print("Shoot Shoot!!")
		
	if (Input.is_key_pressed(KEY_ESCAPE)):
		#prompt before quitting or show the main screen
		get_tree().quit()
	return delta


func _on_shootTimer_timeout():
	shootAllowed=true
	
	
func _on_Area2D_body_entered(body):
	  # print("body is ",body.get_parent().name)
	  remove_child(body.get_parent() )
