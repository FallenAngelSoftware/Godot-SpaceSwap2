# "InputCore.gd"
extends Node

var DelayAllUserInput

var KeyboardSpacebarPressed
var KeyboardEnterPressed

const JoyCentered			= 0
const JoyUp				 	= 1
const JoyRight				= 2
const JoyDown				= 3
const JoyLeft				= 4
var JoystickDirection = []

var MouseButtonLeftPressed

var MouseScreenX
var MouseScreenY

#----------------------------------------------------------------------------------------
func _ready():
	set_process_input(true)
	
	DelayAllUserInput = 0
	
	KeyboardSpacebarPressed = false
	KeyboardEnterPressed = false

	JoystickDirection.append(JoyCentered)
	JoystickDirection.append(JoyCentered)
	
	MouseButtonLeftPressed = false
	
	pass

#----------------------------------------------------------------------------------------
func _process(delta):
	if DelayAllUserInput > -1:
		DelayAllUserInput-=1
	pass

#----------------------------------------------------------------------------------------
func _input(event):
	KeyboardSpacebarPressed = false
	KeyboardEnterPressed = false
	
	JoystickDirection[0] = JoyCentered
	JoystickDirection[1] = JoyCentered
	
	MouseButtonLeftPressed = false

	if DelayAllUserInput > 1:  return false

	if ScreensCore.ScreenFadeStatus != ScreensCore.FadingIdle:  return false

	if Input.is_action_pressed("KeyboardUp"):
		JoystickDirection[0] = JoyUp
	elif Input.is_action_pressed("KeyboardRight"):
		JoystickDirection[0] = JoyRight
	elif Input.is_action_pressed("KeyboardDown"):
		JoystickDirection[0] = JoyDown
	elif Input.is_action_pressed("KeyboardLeft"):
		JoystickDirection[0] = JoyLeft
	
	if event is InputEventKey:
		if event.scancode == KEY_SPACE and event.pressed:
			KeyboardSpacebarPressed = true
		elif event.scancode == KEY_ENTER and event.pressed:
			KeyboardEnterPressed = true
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			MouseButtonLeftPressed = true
		else:
			MouseButtonLeftPressed = false
	elif event is InputEventMouseMotion:
		MouseScreenX = event.position.x
		MouseScreenY = event.position.y
	
	if ScreensCore.OperatingSys == ScreensCore.OSAndroid:
		if event is InputEventScreenTouch:
			if event.pressed:
				MouseButtonLeftPressed = true
				MouseScreenX = event.position.x
				MouseScreenY = event.position.y
	pass
