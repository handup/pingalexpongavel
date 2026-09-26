extends CharacterBody2D
@onready var ball: CharacterBody2D = $"../../Ball"


const SPEED = 650.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("player1_up", "player1_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
