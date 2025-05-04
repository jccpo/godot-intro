extends RigidBody2D

@export var speed: int = 500
var direction: Vector2 = Vector2.UP

func _process(delta):
	#2. Move the laser
	position += direction * speed * delta
