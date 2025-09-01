extends Node2D

@onready var countdown_timer = $Timer
@onready var timer_label = $Timer/timer_label

var total_time = 300
var current_time = total_time 

func _ready():
	countdown_timer.start()
	update_timer_label()
	set_process(true)

func _process(delta):
	if countdown_timer.time_left > 0:
		current_time = int(countdown_timer.time_left)
		update_timer_label()
	else:
		timer_label.text = "¡Sobreviviste!"

func update_timer_label():
	var minutes = current_time / 60
	var seconds = current_time % 60
	timer_label.text = str(minutes) + ":" + str(seconds).pad_zeros(2)
