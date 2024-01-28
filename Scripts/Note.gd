extends Area2D

const TARGET_X = 1055#164
const SPAWN_X = -16
const DIST_TO_TARGET = TARGET_X - SPAWN_X

const TOP_LANE_SPAWN = Vector2(SPAWN_X, 190)
const SECOND_LANE_SPAWN = Vector2(SPAWN_X, 280)
const THIRD_LANE_SPAWN = Vector2(SPAWN_X, 370)
const BOTTOM_LANE_SPAWN = Vector2(SPAWN_X, 465)

var speed = 0
var hit = false


func _ready():
	pass


func _physics_process(delta):
	if !hit:
		position.x += speed * delta
		if position.x > 1100:
			queue_free()
			get_parent().reset_combo()
	else:
		$Node2D.position.x += speed * delta


func initialize(lane):
	if lane == 0:
		$AnimatedSprite.frame = 1
		position = TOP_LANE_SPAWN
		if Global.use_keys:
			$Key.text = "I"
	elif lane == 1:
		$AnimatedSprite.frame = 2
		position = SECOND_LANE_SPAWN
		if Global.use_keys:
			$Key.text = "L"
	elif lane == 2:
		$AnimatedSprite.frame = 4
		position = SECOND_LANE_SPAWN
		if Global.use_keys:
			$Key.text = "J"
	elif lane == 3:
		$AnimatedSprite.frame = 3
		position = THIRD_LANE_SPAWN
		if Global.use_keys:
			$Key.text = "K"
	elif lane == 4:
		$AnimatedSprite.frame = 0
		position = BOTTOM_LANE_SPAWN
		if Global.use_keys:
			$Key.text = "D"
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET / 2.0


func destroy(score):
	$CPUParticles2D.emitting = true
	$AnimatedSprite.visible = false
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "GREAT"
		$Node2D/Label.modulate = Color("f6d6bd")
	elif score == 2:
		$Node2D/Label.text = "GOOD"
		$Node2D/Label.modulate = Color("c3a38a")
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		$Node2D/Label.modulate = Color("997577")


func _on_Timer_timeout():
	queue_free()
