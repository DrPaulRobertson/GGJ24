extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Circle"):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 
								linear_to_db($HSlider.value))
		if get_tree().change_scene_to_file("res://Scenes/Game.tscn") != OK:
			print ("Error changing scene to Game")
	if Input.is_action_just_pressed("Down"):
		if get_tree().change_scene_to_file("res://Scripts/instructions.tscn") != OK:
			print ("Error changing scene to instructions")

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),
								linear_to_db(value))


func _on_check_button_toggled(toggled_on):
	Global.use_keys = toggled_on
	if Global.use_keys:
		$startkey.text = "D"
		$menukey.text = "K"
	else:
		$startkey.text = ""
		$menukey.text = ""
