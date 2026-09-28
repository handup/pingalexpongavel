extends Node2D
const ARBITRU_ = preload("uid://dcvbg332taji0")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")


func _on_local_vs_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.gameMode = "Local"


func _on_ai_vs_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.gameMode = "AI"
