extends Node

var player: AudioStreamPlayer

func _ready():
	# Crear el reproductor solo una vez
	player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = load("res://musica/menu.wav") # o la música base del menú
	player.autoplay = false

func play_menu_music():
	if not player.playing:
		player.play()

func stop_music():
	if player.playing:
		player.stop()
