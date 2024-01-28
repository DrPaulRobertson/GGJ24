extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.use_keys:
		$playkey.text = "D"
		$menukey.text = "I"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Circle"):
		if get_tree().change_scene_to_file("res://Scenes/Game.tscn") != OK:
			print ("Error changing scene to Game")
	
	if Input.is_action_just_pressed("Up"):
		if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
			print ("Error returning to menu")

