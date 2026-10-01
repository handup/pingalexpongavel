extends Node2D

@onready var player_score: Label = $Player_Score
@onready var enemy_score: Label = $Enemy_Score
@onready var player_2: CharacterBody2D = $"../Pausable/Player2"
const GAME_MODE_MANAGER = preload("uid://b2xl2okgcg5yb")
@onready var pausable: Node2D = $"../Pausable"

var Player_score = 0
var Enemy_score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func increasePlayerScore():
	Player_score += 1
	print(Player_score)
	player_score.text = str(Player_score)

func increaseEnemyScore():
	Enemy_score += 1
	print(Enemy_score)
	enemy_score.text = str(Enemy_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		print(pausable.get_tree().paused)
		if pausable.get_tree().paused:
			pausable.get_tree().paused = false
		if !pausable.get_tree().paused:
			pausable.get_tree().paused = true
	
