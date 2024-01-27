extends Node3D

var animation_idx = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.set_current_animation("A_Idle")
	animation_idx = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.score > 200 and animation_idx == 0:
		animation_idx = 1
		$AnimationPlayer.set_current_animation("A_Titter")
	elif Global.score > 600 and animation_idx == 1:
		animation_idx = 2
		$AnimationPlayer.set_current_animation("A_CryLaugh")
