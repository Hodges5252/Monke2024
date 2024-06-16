extends CharacterBody2D

@export var speed = 100

func get_input():
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
