# "InputCore.gd"
extends Node

var KeyboardSpacebarPressed
var MouseButtonLeftPressed


func _ready():
	set_process_input(true)
	
	KeyboardSpacebarPressed = false
	MouseButtonLeftPressed = false
	
	pass


func _process(delta):
	pass


func _input(event):
	
	if event is InputEventKey:
		if event.scancode == KEY_SPACE and event.pressed:
			KeyboardSpacebarPressed = true
		else:
			KeyboardSpacebarPressed = false
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			MouseButtonLeftPressed = true
		else:
			MouseButtonLeftPressed = false

	pass
