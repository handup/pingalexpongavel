extends CharacterBody2D

const SPEED = 650.0
@onready var ball: CharacterBody2D = $"../Ball"

func _physics_process(delta: float) -> void:
	if Globals.gameMode == "Local":
		var direction := Input.get_axis("player2_up", "player2_down")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

	elif Globals.gameMode == "AI":
		if position.y < ball.position.y:
			velocity.y = 1 * SPEED
		else:
			velocity.y = -1 * SPEED
			
	move_and_slide()
