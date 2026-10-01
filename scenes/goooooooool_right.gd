extends Area2D

@onready var arbitru_: Node2D = $"../../../Arbitru'"
@onready var BALL: CharacterBody2D = $"../../Ball"
@onready var timer: Timer = $"../Timer"
@onready var goal_sound_right: AudioStreamPlayer2D = $GoalSoundRight


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if(body.name == "Ball"):
		goal_sound_right.play(0)
		arbitru_.increasePlayerScore()
		BALL.respawn()
		
