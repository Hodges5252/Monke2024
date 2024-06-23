extends Area2D

var SPEED = 30


func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta

func _on_timer_timeout():
	queue_free()

func damage_type():
	return "fstorm"
