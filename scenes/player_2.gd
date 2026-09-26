extends CharacterBody2D


const SPEED = 650.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("player2_up", "player2_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
