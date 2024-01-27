extends Node2D


var score = 0
var combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "NA"


func set_score(new):
	score = new
	if score > 2500:#00:
		grade = "A+"
	elif score > 2000:#00:
		grade = "A"
	elif score > 1500:#00:
		grade = "A-"
	elif score > 1300:#00:
		grade = "B+"
	elif score > 1150:#00:
		grade = "B"
	elif score > 1000:#00:
		grade = "B-"
	elif score > 850:#00:
		grade = "C+"
	elif score > 700:#00:
		grade = "C"
	elif score > 550:#00:
		grade = "C-"
	elif score > 400:#00:
		grade = "D+"
	elif score > 300:#00:
		grade = "D"
	elif score > 200:#00:
		grade = "D-"
	else:
		grade = "F"
		
