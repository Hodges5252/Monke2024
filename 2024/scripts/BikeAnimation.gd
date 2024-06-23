extends StaticBody2D

@export var start_left = "clear"
@export var start_right = "clear"

var codeArray = ["(1, 1, 2)", "(1, 1, 3)", "(1, 1, 4)", "(1, 2, 2)", "(1, 2, 3)", "(1, 2, 4)", "(1, 3, 3)", "(1, 3, 4)", '(1, 4, 4)', "(2, 2, 3)", "(2, 2, 4)", "(2, 3, 3)", "(2, 3, 4)", "(2, 4, 4)", "(3, 3, 4)", "(3, 4, 4)", "clear"]
# Called when the node enters the scene tree for the first time.
func _ready():
	PowerManager.left_can_spin = true
	PowerManager.right_can_spin = true
	randomize()
	if PowerManager.left_code.size() != PowerManager.right_code.size() or PowerManager.left_code.size() !=3:
		switch_wheel_left(start_left)
		switch_wheel_right(start_right)
	else:
		swap_wheels()

func swap_wheels():
	var left = PowerManager.left_code
	var right = PowerManager.right_code
	
	#(1, 1, 2)
	if left.has(1) and left.has(2) and left.count(1) == 2:
		switch_wheel_left("(1, 1, 2)")
	if right.has(1) and right.has(2) and right.count(1) == 2:
		switch_wheel_right("(1, 1, 2)")
	 
	#(1, 1, 3)
	if left.has(1) and left.has(3) and left.count(1) == 2:
		switch_wheel_left("(1, 1, 3)")
	if right.has(1) and right.has(3) and right.count(1) == 2:
		switch_wheel_right("(1, 1, 3)")
	
	#(1, 1, 4)
	if left.has(1) and left.has(4) and left.count(1) == 2:
		switch_wheel_left("(1, 1, 4)")
	if right.has(1) and right.has(4) and right.count(1) == 2:
		switch_wheel_right("(1, 1, 4)")
	
	#(1, 2, 2)
	if left.has(1) and left.has(2) and left.count(2) == 2:
		switch_wheel_left("(1, 2, 2)")
	if right.has(1) and right.has(2) and right.count(2) == 2:
		switch_wheel_right("(1, 2, 2)")
	
	#(1, 2, 3)
	if left.has(1) and left.has(2) and left.has(3):
		switch_wheel_left("(1, 2, 3)")
	if right.has(1) and right.has(2) and right.has(3):
		switch_wheel_right("(1, 2, 3)")
	
	#(1, 2, 4)
	if left.has(1) and left.has(2) and left.has(4):
		switch_wheel_left("(1, 2, 4)")
	if right.has(1) and right.has(2) and right.has(4):
		switch_wheel_right("(1, 2, 4)")
	
	#(1, 3, 3)
	if left.has(1) and left.has(3) and left.count(3) == 2:
		switch_wheel_left("(1, 3, 3)")
	if right.has(1) and right.has(3) and right.count(3) == 2:
		switch_wheel_right("(1, 3, 3)")
	
	#(1, 3, 4)
	if left.has(1) and left.has(3) and left.has(4):
		switch_wheel_left("(1, 3, 4)")
	if right.has(1) and right.has(3) and right.has(4):
		switch_wheel_right("(1, 3, 4)")
	
	#(1, 4, 4)
	if left.has(1) and left.has(4) and left.count(4) == 2:
		switch_wheel_left("(1, 4, 4)")
	if right.has(1) and right.has(4) and right.count(4) == 2:
		switch_wheel_right("(1, 4, 4)")
	
	#(2, 2, 3)
	if left.has(3) and left.has(2) and left.count(2) == 2:
		switch_wheel_left("(2, 2, 3)")
	if right.has(3) and right.has(2) and right.count(2) == 2:
		switch_wheel_right("(2, 2, 3)")
	
	#(2, 2, 4)
	if left.has(4) and left.has(2) and left.count(2) == 2:
		switch_wheel_left("(2, 2, 4)")
	if right.has(4) and right.has(2) and right.count(2) == 2:
		switch_wheel_right("(2, 2, 4)")
	
	#(2, 3, 3)
	if left.has(2) and left.has(3) and left.count(3) == 2:
		switch_wheel_left("(2, 3, 3)")
	if right.has(2) and right.has(3) and right.count(3) == 2:
		switch_wheel_right("(2, 3, 3)")
	
	#(2, 3, 4)
	if left.has(2) and left.has(3) and left.has(4):
		switch_wheel_left("(2, 3, 4)")
	if right.has(2) and right.has(3) and right.has(4):
		switch_wheel_right("(2, 3, 4)")
	
	#(2, 4, 4)
	if left.has(2) and left.has(4) and left.count(4) == 2:
		switch_wheel_left("(2, 4, 4)")
	if right.has(2) and right.has(4) and right.count(4) == 2:
		switch_wheel_right("(2, 4, 4)")
	
	#(3, 3, 4)
	if left.has(4) and left.has(3) and left.count(3) == 2:
		switch_wheel_left("(3, 3, 4)")
	if right.has(4) and right.has(3) and right.count(3) == 2:
		switch_wheel_right("(3, 3, 4)")
	
	#(3, 4, 4)
	if left.has(3) and left.has(4) and left.count(4) == 2:
		switch_wheel_left("(3, 4, 4)")
	if right.has(3) and right.has(4) and right.count(4) == 2:
		switch_wheel_right("(3, 4, 4)")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()

func switch_wheel_left(code):
	if PowerManager.left_wheel != null:
		PowerManager.left_wheel.set_visible(false)
	match code:
		"(1, 1, 2)":
			PowerManager.left_wheel = $"(1, 1, 2)-l"
			PowerManager.left_elem = ["earth", "earth", "water"]
		"(1, 1, 3)":
			PowerManager.left_wheel = $"(1, 1, 3)-l"
			PowerManager.left_elem = ["earth", "earth", "fire"]
		"(1, 1, 4)":
			PowerManager.left_wheel = $"(1, 1, 4)-l"
			PowerManager.left_elem = ["earth", "earth", "air"]
		"(1, 2, 2)":
			PowerManager.left_wheel = $"(1, 2, 2)-l"
			PowerManager.left_elem = ["earth", "water", "water"]
		"(1, 2, 3)":
			PowerManager.left_wheel = $"(1, 2, 3)-l"
			PowerManager.left_elem = ["earth", "water", "fire"]
		"(1, 2, 4)":
			PowerManager.left_wheel = $"(1, 2, 4)-l"
			PowerManager.left_elem = ["earth", "water", "air"]
		"(1, 3, 3)":
			PowerManager.left_wheel = $"(1, 3, 3)-l"
			PowerManager.left_elem = ["earth", "fire", "fire"]
		"(1, 3, 4)":
			PowerManager.left_wheel = $"(1, 3, 4)-l"
			PowerManager.left_elem = ["earth", "fire", "air"]
		"(1, 4, 4)":
			PowerManager.left_wheel = $"(1, 4, 4)-l"
			PowerManager.left_elem = ["earth", "air", "air"]
		"(2, 2, 3)":
			PowerManager.left_wheel = $"(2, 2, 3)-l"
			PowerManager.left_elem = ["water", "water", "fire"]
		"(2, 2, 4)":
			PowerManager.left_wheel = $"(2, 2, 4)-l"
			PowerManager.left_elem = ["water", "water", "air"]
		"(2, 3, 3)":
			PowerManager.left_wheel = $"(2, 3, 3)-l"
			PowerManager.left_elem = ["water", "fire", "fire"]
		"(2, 3, 4)":
			PowerManager.left_wheel = $"(2, 3, 4)-l"
			PowerManager.left_elem = ["water", "fire", "air"]
		"(2, 4, 4)":
			PowerManager.left_wheel = $"(2, 4, 4)-l"
			PowerManager.left_elem = ["water", "air", "air"]
		"(3, 3, 4)":
			PowerManager.left_wheel = $"(3, 3, 4)-l"
			PowerManager.left_elem = ["fire", "fire", "air"]
		"(3, 4, 4)":
			PowerManager.left_wheel = $"(3, 4, 4)-l"
			PowerManager.left_elem = ["fire", "air", "air"]
		"clear":
			PowerManager.left_wheel = %Clear_l
			PowerManager.left_elem = ["", "", ""]
	PowerManager.left_wheel.set_visible(true)
	PowerManager.cycle_left_mark = 1
	PowerManager.l_mark = 1
	PowerManager.left_wheel.play("Static1")
	PowerManager.left = PowerManager.left_elem[PowerManager.l_mark]

func switch_wheel_right(code):
	if PowerManager.right_wheel != null:
		PowerManager.right_wheel.set_visible(false)
	match code:
		"(1, 1, 2)":
			PowerManager.right_wheel = $"(1, 1, 2)-r"
			PowerManager.right_elem = ["earth", "earth", "water"]
		"(1, 1, 3)":
			PowerManager.right_wheel = $"(1, 1, 3)-r"
			PowerManager.right_elem = ["earth", "earth", "fire"]
		"(1, 1, 4)":
			PowerManager.right_wheel = $"(1, 1, 4)-r"
			PowerManager.right_elem = ["earth", "earth", "air"]
		"(1, 2, 2)":
			PowerManager.right_wheel = $"(1, 2, 2)-r"
			PowerManager.right_elem = ["earth", "water", "water"]
		"(1, 2, 3)":
			PowerManager.right_wheel = $"(1, 2, 3)-r"
			PowerManager.right_elem = ["earth", "water", "fire"]
		"(1, 2, 4)":
			PowerManager.right_wheel = $"(1, 2, 4)-r"
			PowerManager.right_elem = ["earth", "water", "air"]
		"(1, 3, 3)":
			PowerManager.right_wheel = $"(1, 3, 3)-r"
			PowerManager.right_elem = ["earth", "fire", "fire"]
		"(1, 3, 4)":
			PowerManager.right_wheel = $"(1, 3, 4)-r"
			PowerManager.right_elem = ["earth", "fire", "air"]
		"(1, 4, 4)":
			PowerManager.right_wheel = $"(1, 4, 4)-r"
			PowerManager.right_elem = ["earth", "air", "air"]
		"(2, 2, 3)":
			PowerManager.right_wheel = $"(2, 2, 3)-r"
			PowerManager.right_elem = ["water", "water", "fire"]
		"(2, 2, 4)":
			PowerManager.right_wheel = $"(2, 2, 4)-r"
			PowerManager.right_elem = ["water", "water", "air"]
		"(2, 3, 3)":
			PowerManager.right_wheel = $"(2, 3, 3)-r"
			PowerManager.right_elem = ["water", "fire", "fire"]
		"(2, 3, 4)":
			PowerManager.right_wheel = $"(2, 3, 4)-r"
			PowerManager.right_elem = ["water", "fire", "air"]
		"(2, 4, 4)":
			PowerManager.right_wheel = $"(2, 4, 4)-r"
			PowerManager.right_elem = ["water", "air", "air"]
		"(3, 3, 4)":
			PowerManager.right_wheel = $"(3, 3, 4)-r"
			PowerManager.right_elem = ["fire", "fire", "air"]
		"(3, 4, 4)":
			PowerManager.right_wheel = $"(3, 4, 4)-r"
			PowerManager.right_elem = ["fire", "air", "air"]
		"clear":
			PowerManager.right_wheel = %Clear_r
			PowerManager.right_elem = ["", "", ""]
	PowerManager.right_wheel.set_visible(true)
	PowerManager.cycle_right_mark = 1
	PowerManager.r_mark = 1
	PowerManager.right_wheel.play("Static1")
	PowerManager.right = PowerManager.right_elem[PowerManager.r_mark]

func rotate_right_wheel():
	match PowerManager.cycle_right_mark:
		1:
			PowerManager.right_wheel.play("Rotate1")
			PowerManager.cycle_right_mark = 2
		2:
			PowerManager.right_wheel.play("Rotate2")
			PowerManager.cycle_right_mark = 3
		3:
			PowerManager.right_wheel.play("Rotate3")
			PowerManager.cycle_right_mark = 1

func rotate_left_wheel():
	match PowerManager.cycle_left_mark:
		1:
			PowerManager.left_wheel.play("Rotate1")
			PowerManager.cycle_left_mark = 2
		2:
			PowerManager.left_wheel.play("Rotate2")
			PowerManager.cycle_left_mark = 3
		3:
			PowerManager.left_wheel.play("Rotate3")
			PowerManager.cycle_left_mark = 1

func l_animation_finished():
	match PowerManager.cycle_left_mark:
			1:
				PowerManager.left_wheel.play("Static1")
				PowerManager.left_can_spin = true
			2:
				PowerManager.left_wheel.play("Static2")
				PowerManager.left_can_spin = true
			3:
				PowerManager.left_wheel.play("Static3")
				PowerManager.left_can_spin = true
	if PowerManager.left_respin:
		PowerManager.left_respin = false
		PowerManager.left_can_spin = false
		rotate_left_wheel()
		if PowerManager.l_mark >= 2:
			PowerManager.l_mark = 0
		else:
			PowerManager.l_mark += 1
		PowerManager.left = PowerManager.left_elem[PowerManager.l_mark]
		print(str(PowerManager.left))

func r_animation_finished():
	match PowerManager.cycle_right_mark:
			1:
				PowerManager.right_wheel.play("Static1")
				PowerManager.right_can_spin = true
			2:
				PowerManager.right_wheel.play("Static2")
				PowerManager.right_can_spin = true
			3:
				PowerManager.right_wheel.play("Static3")
				PowerManager.right_can_spin = true
	if PowerManager.right_respin:
		PowerManager.right_respin = false
		PowerManager.right_can_spin = false
		rotate_right_wheel()
		if PowerManager.r_mark >= 2:
				PowerManager.r_mark = 0
		else:
			PowerManager.r_mark += 1
		PowerManager.right = PowerManager.right_elem[PowerManager.r_mark]
		print(str(PowerManager.right))

func get_input():
	if Input.is_action_just_pressed("l_click"):
		if PowerManager.left_can_spin:
			PowerManager.left_can_spin = false
			rotate_left_wheel()
			if PowerManager.l_mark >= 2:
				PowerManager.l_mark = 0
			else:
				PowerManager.l_mark += 1
			PowerManager.left = PowerManager.left_elem[PowerManager.l_mark]
			print(str(PowerManager.left))
		else:
			PowerManager.left_respin = true
	if Input.is_action_just_pressed("r_click"):
		if PowerManager.right_can_spin:
			PowerManager.right_can_spin = false
			rotate_right_wheel()
			if PowerManager.r_mark >= 2:
				PowerManager.r_mark = 0
			else:
				PowerManager.r_mark += 1
			PowerManager.right = PowerManager.right_elem[PowerManager.r_mark]
			print(str(PowerManager.right))
		else:
			PowerManager.right_respin = true
	if Input.is_action_just_pressed("switch_r"):
		pass
		#var rand_wheel = ""
		#var rand_int = randi() % codeArray.size()
		#rand_wheel = codeArray[rand_int]
		#switch_wheel_right(rand_wheel)
	if Input.is_action_just_pressed("switch_l"):
		pass
		#var rand_wheel = ""
		#var rand_int = randi() % codeArray.size()
		#rand_wheel = codeArray[rand_int]
		#switch_wheel_left(rand_wheel)
