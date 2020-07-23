# "InterfaceCore.gd"
extends Node


var ButtonText = []

class ButtonsClass:
	var ButtonImageIndex = []
	var ButtonTextIndex = []
	var ButtonIndex = []
	var ButtonScreenX = []
	var ButtonScreenY = []
	var ButtonAnimationTimer = []
	var ButtonScale = []
var Buttons = ButtonsClass.new()

var NumberOfButtonsOnScreen
var ButtonSelectedByKeyboard

#----------------------------------------------------------------------------------------
func InitializeButtons(var createTexts):
	Buttons.ButtonImageIndex.clear()
	Buttons.ButtonTextIndex.clear()
	Buttons.ButtonIndex.clear()
	Buttons.ButtonScreenX.clear()
	Buttons.ButtonScreenY.clear()
	Buttons.ButtonAnimationTimer.clear()
	Buttons.ButtonScale.clear()

	for index in range(0, 10):
		Buttons.ButtonImageIndex.append(40+index)
		
		if createTexts == true:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, ButtonText[index], 0, -99999, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0)
		
		Buttons.ButtonTextIndex.append(index)
		Buttons.ButtonIndex.append(-1)
		Buttons.ButtonScreenX.append(0)
		Buttons.ButtonScreenY.append(-99999)
		VisualsCore.Texts.TextImage[index].rect_global_position.y = -99999
		Buttons.ButtonAnimationTimer.append(-1)
		Buttons.ButtonScale.append(1.0)

	NumberOfButtonsOnScreen = 0
	ButtonSelectedByKeyboard = 0

	pass

#----------------------------------------------------------------------------------------
func _ready():
	ButtonText.append("START!")
	ButtonText.append("Options")
	ButtonText.append("How To Play")
	ButtonText.append("High Scores")
	ButtonText.append("About")
	ButtonText.append("Exit")
	ButtonText.append("Back")
	ButtonText.append("CLEAR!")
	ButtonText.append("BGM Test")
	ButtonText.append("N.A.")

	InitializeButtons(true)

	pass

#----------------------------------------------------------------------------------------
func CreateButton (var index, var screenX, var screenY):
	ButtonSelectedByKeyboard = 0

	Buttons.ButtonIndex[NumberOfButtonsOnScreen] = index
	Buttons.ButtonScreenX[NumberOfButtonsOnScreen] = screenX
	Buttons.ButtonScreenY[NumberOfButtonsOnScreen] = screenY
	Buttons.ButtonAnimationTimer[NumberOfButtonsOnScreen] = -1
	Buttons.ButtonScale[NumberOfButtonsOnScreen] = 1.0

	NumberOfButtonsOnScreen+=1

	pass

#----------------------------------------------------------------------------------------
func DrawAllButtons():
	if NumberOfButtonsOnScreen == 0:  return

	for index in range(0, 10):
		if Buttons.ButtonIndex[index] > -1:
			var textWidth = VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].get_font("normal_font").get_string_size(VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].text).x

			if Buttons.ButtonAnimationTimer[index] == 3:
				print("INDEX:", Buttons.ButtonIndex[index])
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(0.85, 0.85)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 0.85, 0.85, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*0.85)) / 2) + ((textWidth*0.85) / 2)))
				Buttons.ButtonAnimationTimer[index]-=1
			elif Buttons.ButtonAnimationTimer[index] == 2:
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(0.90, 0.90)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 0.90, 0.90, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*0.90)) / 2) + ((textWidth*0.90) / 2)))
				Buttons.ButtonAnimationTimer[index]-=1
			elif Buttons.ButtonAnimationTimer[index] == 1:
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(0.95, 0.95)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 0.95, 0.95, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*0.95)) / 2) + ((textWidth*0.95) / 2)))
				Buttons.ButtonAnimationTimer[index]-=1
			elif Buttons.ButtonAnimationTimer[index] == 0:
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(1.0, 1.0)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 1.0, 1.0, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*1.0)) / 2) + ((textWidth*1.0) / 2)))
				Buttons.ButtonAnimationTimer[index] = -1
					
			VisualsCore.Sprites.SpriteImage[40+index].global_position = Vector2(Buttons.ButtonScreenX[index], Buttons.ButtonScreenY[index])

			if index == ButtonSelectedByKeyboard && NumberOfButtonsOnScreen > 1:
				VisualsCore.Sprites.SpriteImage[50].global_position = Vector2((VisualsCore.ScreenWidth/2)-154, Buttons.ButtonScreenY[index])
				VisualsCore.Sprites.SpriteImage[51].global_position = Vector2((VisualsCore.ScreenWidth/2)+154, Buttons.ButtonScreenY[index])

			var textHeight = VisualsCore.Texts.TextImage[index].get_font("normal_font").get_string_size(VisualsCore.Texts.TextImage[index].text).y
			if is_instance_valid(VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]]):
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.y = (Buttons.ButtonScreenY[index]-(textHeight / 2))

	pass

#----------------------------------------------------------------------------------------
func ThisButtonWasPressed(var buttonToCheck):
	if NumberOfButtonsOnScreen == 0:  return false
	if InputCore.DelayAllUserInput > 0:  return false

	for index in range (0, NumberOfButtonsOnScreen):
		if index == buttonToCheck:
			if InputCore.JoystickDirection[0] == InputCore.JoyUp:
				if ButtonSelectedByKeyboard > 0:
					ButtonSelectedByKeyboard-=1
				else:
					ButtonSelectedByKeyboard = NumberOfButtonsOnScreen-1
		
				InputCore.DelayAllUserInput = 10
			elif InputCore.JoystickDirection[0] == InputCore.JoyDown:
				if ButtonSelectedByKeyboard < (NumberOfButtonsOnScreen-1):
					ButtonSelectedByKeyboard+=1
				else:
					ButtonSelectedByKeyboard = 0
		
				InputCore.DelayAllUserInput = 10
		
			if InputCore.KeyboardEnterPressed == true:
				if buttonToCheck == ButtonSelectedByKeyboard:
					Buttons.ButtonAnimationTimer[ButtonSelectedByKeyboard] = 3
					InputCore.DelayAllUserInput = 10
					print("KeyButtonKey:", ButtonSelectedByKeyboard)
					return true

			if InputCore.MouseButtonLeftPressed == true:
				if InputCore.MouseScreenY > (Buttons.ButtonScreenY[index]-21) && InputCore.MouseScreenY < (Buttons.ButtonScreenY[index]+21) && InputCore.MouseScreenX > (Buttons.ButtonScreenX[index]-127) && InputCore.MouseScreenX < (Buttons.ButtonScreenX[index]+127):
					ButtonSelectedByKeyboard = index
					Buttons.ButtonAnimationTimer[ButtonSelectedByKeyboard] = 3
					InputCore.DelayAllUserInput = 10
					print("MouseButtonKey:", ButtonSelectedByKeyboard)
					return true


	pass

#----------------------------------------------------------------------------------------
func _process(delta):
	
	pass
