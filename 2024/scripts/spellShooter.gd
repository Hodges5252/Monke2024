extends Marker2D

var can_use_move = true

func _ready():
	pass

func get_input():
	if Input.is_action_just_pressed("space") and can_use_move:
		use_move()
		can_use_move = false
		$Timer.start()

func _process(delta):
	get_input()
	look_at(get_global_mouse_position())

func shift_mark(marker):
	if marker >= 3:
		marker = 0
	else:
		marker += 1
		

func get_move() -> String:
	var move = ""
	if PowerManager.left == PowerManager.right:
		match PowerManager.left:
			"water":
				move = "Whirlpool"
			"fire":
				move = "Fire Blast"
			"earth":
				move = "Earthquake"
			"air":
				move = "Fierce Gust"
	else:
		match PowerManager.left:
			"water":
				match PowerManager.right:
					"fire":
						move = "Steam Jet"
					"earth":
						move = "Mudslide"
					"air":
						move = "Thunderstorm"
			"fire":
				match PowerManager.right:
					"water":
						move = "Steam Jet"
					"earth":
						move = "Lava Flow"
					"air":
						move = "Firestorm"
			"earth":
				match PowerManager.right:
					"water":
						move = "Mudslide"
					"fire":
						move = "Lava Flow"
					"air":
						move = "Sandstorm"
			"air":
				match PowerManager.right:
					"water":
						move = "Thunderstorm"
					"fire":
						move = "Firestorm"
					"earth":
						move = "Sandstorm"
	return move

func use_move():
	const WHIRLPOOL = preload("res://scenes/powers/whirlpool.tscn")
	const FIREBLAST = preload("res://scenes/powers/fire_blast.tscn")
	const GUST = preload("res://scenes/powers/fierce_gust.tscn")
	const EARTHQUAKE = preload("res://scenes/powers/earthquake.tscn")
	const MUDSLIDE = preload("res://scenes/powers/mudslide.tscn")
	const STEAM = preload("res://scenes/powers/steam_jet.tscn")
	const THUNDERSTORM = preload("res://scenes/powers/thunderstorm.tscn")
	const LAVA = preload("res://scenes/powers/lava_flow.tscn")
	const SANDSTORM = preload("res://scenes/powers/sandstorm.tscn")
	const FIRESTORM = preload("res://scenes/powers/firestorm.tscn")
	
	var move = get_move()
	print("Using move: " + move)
	match move:
		"Whirlpool":
			var new_move = WHIRLPOOL.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation
			%Origin.add_child(new_move)
		"Fire Blast":
			var new_move = FIREBLAST.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation
			%Origin.add_child(new_move)
		"Earthquake":
			var new_move = EARTHQUAKE.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation
			%Origin.add_child(new_move)
		"Fierce Gust":
			var new_move = GUST.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation
			%Origin.add_child(new_move)
		"Steam Jet":
			var new_move = STEAM.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation
			%Origin.add_child(new_move)
		"Mudslide":
			var new_move = MUDSLIDE.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation + 1.57
			%Origin.add_child(new_move)
		"Thunderstorm":
			var new_move = THUNDERSTORM.instantiate()
			new_move.global_position = %Origin.global_position
			%Origin.add_child(new_move)
		"Lava Flow":
			var new_move = LAVA.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation + 1.57
			%Origin.add_child(new_move)
		"Firestorm":
			var new_move = FIRESTORM.instantiate()
			new_move.global_position = %Origin.global_position
			
			new_move.global_rotation = %Origin.global_rotation
			%Origin.add_child(new_move)
		"Sandstorm":
			var new_move = SANDSTORM.instantiate()
			new_move.global_position = %Origin.global_position
			new_move.global_rotation = %Origin.global_rotation + 1.57
			%Origin.add_child(new_move)

func _on_timer_timeout():
	can_use_move = true
