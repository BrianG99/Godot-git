extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/sala.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()

func _ready():
	Musicmenu.play_menu_music()
