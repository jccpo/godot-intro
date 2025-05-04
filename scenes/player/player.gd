extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal player_shot_laser(pos)
signal player_threw_grenade(pos)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_just_pressed("primary action") and can_laser:
		#randomly selected a marker2d for the laser start 
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$TimerLaser.start()
		#emit the position we selected
		player_shot_laser.emit(selected_laser.global_position)
		
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		can_grenade = false
		$TimerGrenade.start()
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		player_threw_grenade.emit(selected_grenade.global_position)
		
func _on_timer_timeout_laser():
	can_laser = true

func _on_timer_grenade_timeout():
	can_grenade = true
