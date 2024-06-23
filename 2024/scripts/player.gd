extends CharacterBody2D

@export var speed = 100
var health = 100
var alive = true

func get_input():
	if alive:
		var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if Input.is_action_pressed("move_left"):
			$CharacterAnimation.play("left")
		elif Input.is_action_pressed("move_right"):
			$CharacterAnimation.play("right")
		elif Input.is_action_pressed("move_up"):
			$CharacterAnimation.play("up")
		elif Input.is_action_pressed("move_down"):
			$CharacterAnimation.play("down")
		else:
			if $CharacterAnimation.is_playing():
				$CharacterAnimation.stop()
		velocity = input_direction * speed
		

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = $hitbox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		$ProgressBar.value = health
		if health <= 0.0:
			alive = false


