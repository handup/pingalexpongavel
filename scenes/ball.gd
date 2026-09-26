extends CharacterBody2D

func respawn():
	position = Vector2(526.0, 323.5)
	velocity.y = -1 * 400
	velocity.x = -1 * 400
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.y = -1 * 400
	velocity.x = -1 * 400
	print(position)
	pass # Replace with function body.


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
