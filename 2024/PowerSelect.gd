extends Node2D

var water_count = 0
var fire_count = 0
var air_count = 0
var earth_count = 0

var right_count = 0
var left_count = 0

@onready var right_wheel = $Control/VBoxContainer/HBoxContainer/RightWheel
@onready var left_wheel = $Control/VBoxContainer/HBoxContainer/LeftWheel

@onready var left_label_01 = $Control/VBoxContainer/Left/Left1/Label
@onready var left_label_02 = $Control/VBoxContainer/Left/Left2/Label
@onready var left_label_03 = $Control/VBoxContainer/Left/Left3/Label

@onready var right_label_01 = $Control/VBoxContainer/Right/Right1/Label
@onready var right_label_02 = $Control/VBoxContainer/Right/Right2/Label
@onready var right_label_03 = $Control/VBoxContainer/Right/Right3/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	right_wheel.add_item("Water", 1)
	left_wheel.add_item("Water", 1)
	right_wheel.add_item("Earth", 2)
	left_wheel.add_item("Earth", 2)
	right_wheel.add_item("Fire", 3)
	left_wheel.add_item("Fire", 3)
	right_wheel.add_item("Air", 4)
	left_wheel.add_item("Air", 4)
	
	left_wheel.select(-1)
	right_wheel.select(-1)
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if left_label_01.text != "" and left_label_02.text != "" and left_label_03.text != "" and right_label_01.text != "" and right_label_02.text != "" and right_label_03.text != "":
		$Control/VBoxContainer/HBoxContainer2/Submit.disabled = false
	else:
		$Control/VBoxContainer/HBoxContainer2/Submit.disabled = true
	$RightPower.text = "Right Element: " + PowerManager.right
	$LeftPower.text = "Left Element: " + PowerManager.left
	$Move.text = "Move: " + get_move()

func _on_right_wheel_item_selected(index):
	var element = right_wheel.get_item_text(index)
	match element:
		"Water":
			water_count += 1
		"Fire":
			fire_count += 1
		"Air":
			air_count += 1
		"Earth":
			earth_count += 1
	add_right_label(element)
	update_buttons()

func update_buttons():
	left_wheel.select(-1)
	right_wheel.select(-1)
	#print("wc: " + str(water_count), "ec: " + str(earth_count), "ac: " + str(air_count), "fc: " + str(fire_count), "lc: " + str(left_count), "rc: " + str(right_count),)
	if water_count >= 2:
		var right = right_wheel.get_item_index(1)
		var left = left_wheel.get_item_index(1)
		right_wheel.remove_item(right)
		left_wheel.remove_item(left)
	if earth_count >= 2:
		var right = right_wheel.get_item_index(2)
		var left = left_wheel.get_item_index(2)
		right_wheel.remove_item(right)
		left_wheel.remove_item(left)
	if fire_count >= 2:
		var right = right_wheel.get_item_index(3)
		var left = left_wheel.get_item_index(3)
		right_wheel.remove_item(right)
		left_wheel.remove_item(left)
	if air_count >= 2:
		var right = right_wheel.get_item_index(4)
		var left = left_wheel.get_item_index(4)
		right_wheel.remove_item(right)
		left_wheel.remove_item(left)
	if left_count >= 3:
		left_wheel.clear()
	if right_count >= 3:
		right_wheel.clear()

func reset():
	right_wheel.clear()
	left_wheel.clear()
	
	right_wheel.add_item("Water", 1)
	left_wheel.add_item("Water", 1)
	right_wheel.add_item("Earth", 2)
	left_wheel.add_item("Earth", 2)
	right_wheel.add_item("Fire", 3)
	left_wheel.add_item("Fire", 3)
	right_wheel.add_item("Air", 4)
	left_wheel.add_item("Air", 4)
	
	water_count = 0
	fire_count = 0
	air_count = 0
	earth_count = 0

	right_count = 0
	left_count = 0
	
	right_label_01.text = ""
	right_label_02.text = ""
	right_label_03.text = ""
	
	left_label_01.text = ""
	left_label_02.text = ""
	left_label_03.text = ""
	
	left_wheel.select(-1)
	right_wheel.select(-1)
	
	$PowerCycle.switch_wheel_left("clear")
	$PowerCycle.switch_wheel_right("clear")
	$Control/VBoxContainer/Button.disabled = true
	$LeftPower.visible = false
	$RightPower.visible = false
	$Move.visible = false

func add_left_label(index):
	print("lefty: " + str(left_count))
	match left_count:
		0:
			left_label_01.text = index
			left_count += 1
		1:
			left_label_02.text = index
			left_count += 1
		2:
			left_label_03.text = index
			left_count += 1
	

func add_right_label(index):
	print("lefty: " + str(right_count))
	match right_count:
		0:
			right_label_01.text = index
			right_count += 1
		1:
			right_label_02.text = index
			right_count += 1
		2:
			right_label_03.text = index
			right_count += 1
	


func _on_left_wheel_item_selected(index):
	var element = left_wheel.get_item_text(index)
	match element:
		"Water":
			water_count += 1
		"Fire":
			fire_count += 1
		"Air":
			air_count += 1
		"Earth":
			earth_count += 1
	add_left_label(element)
	update_buttons()


func _on_reset_pressed():
	reset()


func _on_submit_pressed():
	var left_value = []
	var right_value = []
	match left_label_01.text:
		"Earth":
			left_value.append(1)
		"Water":
			left_value.append(2)
		"Fire":
			left_value.append(3)
		"Air":
			left_value.append(4)
	match left_label_02.text:
		"Earth":
			left_value.append(1)
		"Water":
			left_value.append(2)
		"Fire":
			left_value.append(3)
		"Air":
			left_value.append(4)
	match left_label_03.text:
		"Earth":
			left_value.append(1)
		"Water":
			left_value.append(2)
		"Fire":
			left_value.append(3)
		"Air":
			left_value.append(4)
	match right_label_01.text:
		"Earth":
			right_value.append(1)
		"Water":
			right_value.append(2)
		"Fire":
			right_value.append(3)
		"Air":
			right_value.append(4)
	match right_label_02.text:
		"Earth":
			right_value.append(1)
		"Water":
			right_value.append(2)
		"Fire":
			right_value.append(3)
		"Air":
			right_value.append(4)
	match right_label_03.text:
		"Earth":
			right_value.append(1)
		"Water":
			right_value.append(2)
		"Fire":
			right_value.append(3)
		"Air":
			right_value.append(4)
	
	PowerManager.right_code = right_value
	PowerManager.left_code = left_value
	
	$PowerCycle.swap_wheels()
	$Control/VBoxContainer/Start.disabled = false
	$LeftPower.visible = true
	$RightPower.visible = true
	$Move.visible = true


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game_world.tscn")

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
