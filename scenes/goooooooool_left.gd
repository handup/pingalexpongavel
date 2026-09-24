extends Area2D

@onready var arbitru_: Node2D = $"../../Arbitru'"
const BALL = preload("uid://bhu5yr56gsy0f")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	# ball disappear
	arbitru_.increaseEnemyScore()
	# restart level
	BALL.reset_state()
	pass # Replace with function body.
