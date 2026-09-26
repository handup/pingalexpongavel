extends CharacterBody2D
@onready var trail: Sprite2D = $Trail
@onready var player_1: Node2D = $"../Player"
@onready var player_2: CharacterBody2D = $"../Player2"
@onready var timer: Timer = $RespawnTimer

const SPEED = 700
var bounces = 0 # maybe todo increase sound effect pitch and ball color too

func respawn():
	bounces = 0
	velocity.y = 0
	velocity.x = 0
	trail.visible = false
	position = Vector2(567.0, 323.5)
	timer.start()
	
func _ready() -> void:
	timer.start()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		bounces += 1
		velocity = velocity.bounce(collision.get_normal())
		if bounces < 20:
			velocity *= 1.05
		
		if collider.name == "CharacterBody2D":
			if collider.velocity.y * velocity.y < 0:
				velocity.y *= -1
				velocity *= 0.85
			else:
				velocity *= 1.25
			position += velocity.normalized() * 20 # attempt to fix buggy behaviour when hitting the ball with the top or bottom of the paddle
	trail.rotation = velocity.angle() + deg_to_rad(45)


func _on_timer_timeout() -> void:
	timer.stop()
	velocity.x = SPEED * [-1, 1].pick_random()
	velocity = velocity.rotated(randf_range(-deg_to_rad(20), deg_to_rad(20)))
	trail.rotation = velocity.angle() + deg_to_rad(45)
	trail.visible = true
