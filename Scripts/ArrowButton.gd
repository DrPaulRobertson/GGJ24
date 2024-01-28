extends AnimatedSprite2D

var perfect = false
var good = false
var okay = false
var current_note = null

@export var input = ""
@export var sfx :Array[Resource] = []

var audio_player = AudioStreamPlayer.new()
var audio_stream_randomizer = AudioStreamRandomizer.new()
var rng = RandomNumberGenerator.new()

func _ready():
	audio_player.volume_db = 1.0
	add_child(audio_player)
	# Assume 'sound1', 'sound2', etc. are preloaded AudioStream resources
	#var items = sfx.get_items()
	for index in sfx.size():
		audio_stream_randomizer.add_stream(index, sfx[index])
	#audio_stream_randomizer.add_audio_stream(sound1)
	#audio_stream_randomizer.add_audio_stream(sound2)
	#audio_stream_randomizer.add_audio_stream(sound3)

func play_random_sound():
	var my_random_number = rng.randi_range(0, sfx.size()-1)
	var random_stream = audio_stream_randomizer.get_stream(my_random_number)
	audio_player.stream = random_stream
	audio_player.play()

func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				play_random_sound()
				if perfect:
					get_parent().increment_score(3)
					current_note.destroy(3)
				elif good:
					get_parent().increment_score(2)
					current_note.destroy(2)
				elif okay:
					get_parent().increment_score(1)
					current_note.destroy(1)
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed(input):
			frame = 1
		elif event.is_action_released(input):
			$PushTimer.start()


func _on_PerfectArea_area_entered(area):
	if area.is_in_group("note"):
		perfect = true


func _on_PerfectArea_area_exited(area):
	if area.is_in_group("note"):
		perfect = false


func _on_GoodArea_area_entered(area):
	if area.is_in_group("note"):
		good = true


func _on_GoodArea_area_exited(area):
	if area.is_in_group("note"):
		good = false


func _on_OkayArea_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area


func _on_OkayArea_area_exited(area):
	if area.is_in_group("note"):
		okay = false
		current_note = null


func _on_PushTimer_timeout():
	frame = 0


func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false
