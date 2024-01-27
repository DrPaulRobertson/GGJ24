extends Node2D

var capture_input = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$GradeNumber.text = Global.grade
	$ScoreNumber.text = str(Global.score)
	$ComboNumber.text = str(Global.combo)
	#$GreatNumber.text = str(Global.great)
	#$GoodNumber.text = str(Global.good)
	#$OkayNumber.text = str(Global.okay)
	#$MissedNumber.text = str(Global.missed)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if capture_input:
		if Input.is_action_just_pressed("Circle"):
			if get_tree().change_scene_to_file("res://Scenes/Game.tscn") != OK:
				print ("Error changing scene to Game")
				
		if Input.is_action_just_pressed("Up"):
			if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
				print ("Error returning to menu")


func _on_timer_timeout():
	capture_input = true
