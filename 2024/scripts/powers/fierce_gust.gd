extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.set_emitting(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var parent = get_parent()
	global_position = parent.global_position
	global_rotation = parent.global_rotation + 1.57


func _on_cpu_particles_2d_finished():
	queue_free()
