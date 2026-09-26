extends CharacterBody2D
@onready var trail: Sprite2D = $Trail
@onready var player_1: Node2D = $"../Player"
@onready var player_2: CharacterBody2D = $"../Player2"
@onready var timer: Timer = $Timer

const SPEED = 500
var bounces = 0 # maybe todo increase sound effect pitch and ball color too

func respawn():
	bounces = 0
	position = Vector2(567.0, 323.5)
	velocity.y = -1 * SPEED
	velocity.x = -1 * SPEED
	pass

func _ready() -> void:
	velocity.y = -1 * SPEED
	velocity.x = -1 * SPEED


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		bounces += 1
		velocity = velocity.bounce(collision.get_normal())
		velocity *= 1.05
		
		if collider.name == "CharacterBody2D":
			if collider.velocity.y * velocity.y < 0:
				velocity.y *= -1
			position += velocity.normalized() * 20 # attempt to fix buggy behaviour when hitting the ball with the top or bottom of the paddle

	trail.rotation = velocity.angle() + deg_to_rad(45)
