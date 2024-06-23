extends CharacterBody2D

var health = 100
var goal = false
var SPEED = 75

@onready var player = $"../../Player"

var earth = false
var gust = false
var fstorm = false
var fire = false
var lava = false
var mud = false
var sand = false
var steam = false
var thunder = false
var whirl = false
var whirlspot

func _physics_process(delta):
	
	if earth or mud:
		SPEED = 30
	if gust:
		SPEED = -75
	if whirl:
		var direction = global_position.direction_to(whirlspot.global_position)
		velocity = direction * SPEED
		move_and_slide()
	if sand and not gust:
		SPEED = 0
	if not gust and not mud and not sand and not mud:
		SPEED = 75
	if goal:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * SPEED
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("get_input"):
		goal = true


func _on_area_2d_body_exited(body):
	if body.has_method("get_input"):
		goal = false

func _on_hitbox_area_entered(area):
	if area.has_method("damage_type"):
		set_damage(area.damage_type())
		if area.damage_type() == "whirl":
			area.global_position = whirlspot


func _on_hitbox_area_exited(area):
	if area.has_method("damage_type"):
		stop_damage(area.damage_type())

func set_damage(value):
	match value:
		"earth":
			earth = true
		"gust":
			gust = true
		"fstorm":
			fstorm = true
		"fire":
			fire = true
			take_damage(75)
		"lava":
			lava = true
		"mud":
			mud = true
		"sand":
			sand = true
		"steam":
			steam = true
		"thunder":
			thunder = true
			take_damage(100)
		"whirl":
			whirl = true

func stop_damage(value):
	match value:
		"earth":
			earth = false
		"gust":
			gust = false
		"fstorm":
			fstorm = false
		"fire":
			fire = false
		"lava":
			lava = false
		"mud":
			mud = false
		"sand":
			sand = false
		"steam":
			steam = false
		"thunder":
			thunder = false
		"whirl":
			whirl = false


func _on_one_sec_timeout():
	if lava:
		take_damage(25)


func _on_half_sec_timeout():
	if fstorm:
		take_damage(10)


func _on_quart_sec_timeout():
	if steam:
		take_damage(5)

func take_damage(val):
	health -= val
	$AnimationPlayer.play("damage")
	if health <= 0:
		queue_free()
