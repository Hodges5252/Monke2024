extends Node2D

var water_count = 0
var fire_count = 0
var air_count = 0
var earth_count = 0

var right_count = 1
var left_count = 1

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
	if water_count >= 2:
		right_wheel.remove_item(1)
		left_wheel.remove_item(1)
	if earth_count >= 2:
		right_wheel.remove_item(2)
		left_wheel.remove_item(2)
	if air_count >= 2:
		right_wheel.remove_item(3)
		left_wheel.remove_item(3)
	if fire_count >= 2:
		right_wheel.remove_item(4)
		left_wheel.remove_item(4)
	if left_count >= 3:
		left_wheel.clear()
	if right_count >= 3:
		left_wheel.clear()

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
	
	right_label_01.text("")
	right_label_02.text("")
	right_label_03.text("")
	
	left_label_01.text("")
	left_label_02.text("")
	left_label_03.text("")

func add_left_label(index):
	match left_count:
		1:
			left_label_01 = index
		2:
			left_label_02 = index
		3:
			left_label_03 = index
	left_count += 1

func add_right_label(index):
	match right_count:
		1:
			right_label_01.text = index
		2:
			right_label_02 = index
		3:
			right_label_03 = index
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
