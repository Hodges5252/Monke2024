extends CharacterBody2D

var health = 100
var goal = false
var SPEED = 75

@export var player : CharacterBody2D


func _physics_process(delta):
	if goal:
		print("Enemy: " + str(global_position))
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * SPEED
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("get_input"):
		goal = true


func _on_area_2d_body_exited(body):
	if body.has_method("get_input"):
		goal = false
