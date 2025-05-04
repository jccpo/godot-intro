extends CharacterBody2D

func _process(_delta):
	var direction = Vector2.RIGHT
	velocity = direction * 400
	move_and_slide()
	#if get_slide_collision_count() > 0:
		#print("aqui")
		#velocity += Vector2(100,0) * Vector2(-1,0)
		#print(velocity)
