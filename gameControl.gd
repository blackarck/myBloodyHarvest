extends Node2D
 
var maxenemcnt=4
var curr_enem_cnt=0
var score=0
var lives=3

export(PackedScene) var critterScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	print("Starting game")
	$Control/scorelbl.text="Score: "
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/scorelbl.text="Score: " + str(score) + " Life: " + str(lives)
func _on_spawnTimer_timeout():
	
	#spawn another enemy
	if(curr_enem_cnt < maxenemcnt):
		 var posy=130
# warning-ignore:unused_variable
		 var posx=170
		 var crit= critterScene.instance()
		 var random = RandomNumberGenerator.new()
		 random.randomize()
		 var ydir= random.randi_range(0,5)
		 if(ydir==1):
			 posy=130
		 elif (ydir==2):
			 posy=230
		 elif (ydir==3):
			 posy=380
		 elif (ydir==4):
			 posy=480

		 var xdir= random.randi_range(0,7)
		 if(xdir==1):
			 posx=170
		 elif (xdir==2):
			 posx=260
		 elif (xdir==3):
			 posx=460
		 elif (xdir==4):
			 posx=550
		 elif (xdir==5):
			 posx=750
		 elif (xdir==6):
			 posx=840	
			
		 crit.position.x=posx
		 crit.position.y=posy
		 add_child(crit)
		 #print("Spawn timer timeout")
		 curr_enem_cnt=curr_enem_cnt+1


func _on_startTimer_timeout():
	#print("Starting timer ")
	$spawnTimer.start()


