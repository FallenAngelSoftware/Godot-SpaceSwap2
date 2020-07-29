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


class ArrowSetsClass:
	var ArrowSetIndex = []
	var ArrowSetScreenY = []
	var ArrowSetLeftAnimationTimer = []
	var ArrowSetRightAnimationTimer = []
	var ArrowSetLeftScale = []
	var ArrowSetRightScale = []
	var ArrowSetTextStringIndex = []
var ArrowSets = ArrowSetsClass.new()

var NumberOfArrowSetsOnScreen
var ArrowSetSelectedByKeyboard
var ArrowSetSelectedByKeyboardLast

class IconClass:
	var IconIndex = []
	var IconSprite = []
	var IconScreenX = []
	var IconScreenY = []
	var IconAnimationTimer = []
	var IconScale = []
	var IconText = []
var Icons = IconClass.new()

var NumberOfIconsOnScreen

#----------------------------------------------------------------------------------------
func InitializeGUI(var createTexts):
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

	ArrowSets.ArrowSetScreenY.clear()
	ArrowSets.ArrowSetLeftAnimationTimer.clear()
	ArrowSets.ArrowSetRightAnimationTimer.clear()
	ArrowSets.ArrowSetLeftScale.clear()
	ArrowSets.ArrowSetRightScale.clear()
	ArrowSets.ArrowSetTextStringIndex.clear()

	for index in range(0, 20):
		ArrowSets.ArrowSetIndex.append(-1)
		ArrowSets.ArrowSetScreenY.append(-99999)
		ArrowSets.ArrowSetLeftAnimationTimer.append(-1)
		ArrowSets.ArrowSetRightAnimationTimer.append(-1)
		ArrowSets.ArrowSetLeftScale.append(1.0)
		ArrowSets.ArrowSetRightScale.append(1.0)
		ArrowSets.ArrowSetTextStringIndex.append(" ")

	NumberOfArrowSetsOnScreen = 0
	ArrowSetSelectedByKeyboard = 0
	
	for index in range(0, 20):
		Icons.IconIndex.append(-1)
		Icons.IconSprite.append(-1)
		Icons.IconScreenX.append(-99999)
		Icons.IconScreenY.append(-99999)
		Icons.IconAnimationTimer.append(-1)
		Icons.IconScale.append(1.0)
		Icons.IconText.append(" ")

	NumberOfIconsOnScreen = 0

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

	InitializeGUI(true)
	
	NumberOfArrowSetsOnScreen = 0
	ArrowSetSelectedByKeyboard = 0

	ArrowSetSelectedByKeyboardLast = -1

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

	for index in range(0, NumberOfButtonsOnScreen):
		if Buttons.ButtonIndex[index] > -1:
			var textWidth = VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].get_font("normal_font").get_string_size(VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].text).x

			if Buttons.ButtonAnimationTimer[index] == 3:
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(0.85, 0.85)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 0.85, 0.85, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*0.85)) / 2) + ((textWidth*0.85) / 2)))
			elif Buttons.ButtonAnimationTimer[index] == 2:
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(0.90, 0.90)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 0.90, 0.90, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*0.90)) / 2) + ((textWidth*0.90) / 2)))
			elif Buttons.ButtonAnimationTimer[index] == 1:
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(0.95, 0.95)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 0.95, 0.95, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*0.95)) / 2) + ((textWidth*0.95) / 2)))
			elif Buttons.ButtonAnimationTimer[index] == 0:
				VisualsCore.Sprites.SpriteImage[40+index].scale = Vector2(1.0, 1.0)
				VisualsCore.DrawnTextChangeScaleRotation(Buttons.ButtonIndex[index], 1.0, 1.0, 0)
				VisualsCore.Texts.TextImage[Buttons.ButtonIndex[index]].rect_global_position.x = (Buttons.ButtonScreenX[index]-(((textWidth-(textWidth*1.0)) / 2) + ((textWidth*1.0) / 2)))
					
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

				AudioCore.PlayEffect(0)

				InputCore.DelayAllUserInput = 10
			elif InputCore.JoystickDirection[0] == InputCore.JoyDown:
				if ButtonSelectedByKeyboard < (NumberOfButtonsOnScreen-1):
					ButtonSelectedByKeyboard+=1
				else:
					ButtonSelectedByKeyboard = 0

				AudioCore.PlayEffect(0)

				InputCore.DelayAllUserInput = 10

			if InputCore.KeyboardEnterPressed == true:
				if buttonToCheck == ButtonSelectedByKeyboard:
					Buttons.ButtonAnimationTimer[ButtonSelectedByKeyboard] = 3
					AudioCore.PlayEffect(1)
					InputCore.DelayAllUserInput = 30

			if Buttons.ButtonAnimationTimer[index] > -1:
				Buttons.ButtonAnimationTimer[index]-=1
				if Buttons.ButtonAnimationTimer[index] == -1:  return true

	if InputCore.MouseButtonLeftPressed == true:
		for index in range (0, NumberOfButtonsOnScreen):
			if InputCore.MouseScreenY > (Buttons.ButtonScreenY[index]-21) && InputCore.MouseScreenY < (Buttons.ButtonScreenY[index]+21) && InputCore.MouseScreenX > (Buttons.ButtonScreenX[index]-127) && InputCore.MouseScreenX < (Buttons.ButtonScreenX[index]+127):
				ButtonSelectedByKeyboard = index
				Buttons.ButtonAnimationTimer[ButtonSelectedByKeyboard] = 3
				AudioCore.PlayEffect(1)
				InputCore.DelayAllUserInput = 30
	pass

#----------------------------------------------------------------------------------------
func CreateArrowSet(var index, var screenY):
	if ArrowSetSelectedByKeyboardLast == -1:
		ArrowSetSelectedByKeyboard = 0
	else:  ArrowSetSelectedByKeyboard = ArrowSetSelectedByKeyboardLast
	
	ArrowSets.ArrowSetIndex[NumberOfArrowSetsOnScreen] = index
	ArrowSets.ArrowSetScreenY[NumberOfArrowSetsOnScreen] = screenY
	ArrowSets.ArrowSetLeftAnimationTimer[NumberOfArrowSetsOnScreen] = -1
	ArrowSets.ArrowSetRightAnimationTimer[NumberOfArrowSetsOnScreen] = -1
	ArrowSets.ArrowSetLeftScale[NumberOfArrowSetsOnScreen] = 1.0
	ArrowSets.ArrowSetRightScale[NumberOfArrowSetsOnScreen] = 1.0

	NumberOfArrowSetsOnScreen+=1

	pass

#----------------------------------------------------------------------------------------
func DrawAllArrowSets():
	if NumberOfArrowSetsOnScreen == 0:  return

	for index in range(0, NumberOfArrowSetsOnScreen):
		if ArrowSets.ArrowSetIndex[index] > -1:
			VisualsCore.Sprites.SpriteImage[80+(index*2)].global_position = Vector2((VisualsCore.ScreenWidth-30), ArrowSets.ArrowSetScreenY[index])
			VisualsCore.Sprites.SpriteImage[81+(index*2)].global_position = Vector2((30), ArrowSets.ArrowSetScreenY[index])

			if ArrowSets.ArrowSetLeftAnimationTimer[(index*2)] == 3:
				VisualsCore.Sprites.SpriteImage[81+(index*2)].scale = Vector2(0.85, 0.85)
			elif ArrowSets.ArrowSetLeftAnimationTimer[(index*2)] == 2:
				VisualsCore.Sprites.SpriteImage[81+(index*2)].scale = Vector2(0.90, 0.90)
			elif ArrowSets.ArrowSetLeftAnimationTimer[(index*2)] == 1:
				VisualsCore.Sprites.SpriteImage[81+(index*2)].scale = Vector2(0.95, 0.95)
			elif ArrowSets.ArrowSetLeftAnimationTimer[(index*2)] == 0:
				VisualsCore.Sprites.SpriteImage[81+(index*2)].scale = Vector2(1.0, 1.0)

			if ArrowSets.ArrowSetRightAnimationTimer[(index*2)] == 3:
				VisualsCore.Sprites.SpriteImage[80+(index*2)].scale = Vector2(0.85, 0.85)
			elif ArrowSets.ArrowSetRightAnimationTimer[(index*2)] == 2:
				VisualsCore.Sprites.SpriteImage[80+(index*2)].scale = Vector2(0.90, 0.90)
			elif ArrowSets.ArrowSetRightAnimationTimer[(index*2)] == 1:
				VisualsCore.Sprites.SpriteImage[80+(index*2)].scale = Vector2(0.95, 0.95)
			elif ArrowSets.ArrowSetRightAnimationTimer[(index*2)] == 0:
				VisualsCore.Sprites.SpriteImage[80+(index*2)].scale = Vector2(1.0, 1.0)

	VisualsCore.Sprites.SpriteImage[60].global_position = Vector2((VisualsCore.ScreenWidth/2), ArrowSets.ArrowSetScreenY[ArrowSetSelectedByKeyboard])

	pass

#----------------------------------------------------------------------------------------
func ThisArrowWasPressed(var arrowToCheck):
	if NumberOfArrowSetsOnScreen == 0:  return false

	var arrowSetToCheck = -1
	for index in range(0, NumberOfArrowSetsOnScreen):
		if ArrowSets.ArrowSetLeftAnimationTimer[(index*2)] > -1:
			arrowSetToCheck = index
		elif ArrowSets.ArrowSetRightAnimationTimer[(index*2)] > -1:
			arrowSetToCheck = (index+0.5)

	if (arrowSetToCheck == arrowToCheck):
		if ArrowSets.ArrowSetLeftAnimationTimer[(arrowSetToCheck*2)] > -1:
			ArrowSets.ArrowSetLeftAnimationTimer[(arrowSetToCheck*2)]-=1
#			print("AnimTimer="+str(ArrowSets.ArrowSetLeftAnimationTimer[(arrowSetToCheck*2)])+" / arrowSetToCheck="+str(arrowSetToCheck)+" / Check"+str(arrowToCheck))
			if (ArrowSets.ArrowSetLeftAnimationTimer[(arrowSetToCheck*2)] == 0 && arrowToCheck == (arrowSetToCheck)):  return true
		elif ArrowSets.ArrowSetRightAnimationTimer[(floor(arrowSetToCheck)*2)] > -1:
			ArrowSets.ArrowSetRightAnimationTimer[(floor(arrowSetToCheck)*2)]-=1
#			print("AnimTimer="+str(ArrowSets.ArrowSetRightAnimationTimer[(floor(arrowSetToCheck)*2)])+" / arrowSetToCheck="+str(floor(arrowSetToCheck))+" / Check"+str(arrowToCheck))
			if (ArrowSets.ArrowSetRightAnimationTimer[(floor(arrowSetToCheck)*2)] == 0 && arrowToCheck == (arrowSetToCheck)):  return true

	if InputCore.DelayAllUserInput > 0:  return false

	if InputCore.MouseButtonLeftPressed == true:
		for index in range(0, NumberOfArrowSetsOnScreen):
			if ArrowSets.ArrowSetIndex[index] > -1:
				if InputCore.MouseScreenY > (ArrowSets.ArrowSetScreenY[index]-21) && InputCore.MouseScreenY < (ArrowSets.ArrowSetScreenY[index]+21) && InputCore.MouseScreenX > (30-25) && InputCore.MouseScreenX < (30+25):
					ArrowSetSelectedByKeyboard = index

					InputCore.JoystickDirection[0] = InputCore.JoyLeft
				elif InputCore.MouseScreenY > (ArrowSets.ArrowSetScreenY[index]-21) && InputCore.MouseScreenY < (ArrowSets.ArrowSetScreenY[index]+21) && InputCore.MouseScreenX > ((VisualsCore.ScreenWidth-30)-25) && InputCore.MouseScreenX < ((VisualsCore.ScreenWidth-30)+25):
					ArrowSetSelectedByKeyboard = index

					InputCore.JoystickDirection[0] = InputCore.JoyRight

	if InputCore.JoystickDirection[0] == InputCore.JoyLeft && ArrowSetSelectedByKeyboard == arrowToCheck:
		ArrowSets.ArrowSetLeftAnimationTimer[(ArrowSetSelectedByKeyboard*2)] = 3
		InputCore.DelayAllUserInput = 20
		ArrowSetSelectedByKeyboardLast = ArrowSetSelectedByKeyboard
		AudioCore.PlayEffect(0)
	elif InputCore.JoystickDirection[0] == InputCore.JoyRight && (ArrowSetSelectedByKeyboard+0.5) == arrowToCheck:
		ArrowSets.ArrowSetRightAnimationTimer[(ArrowSetSelectedByKeyboard*2)] = 3
		InputCore.DelayAllUserInput = 20
		ArrowSetSelectedByKeyboardLast = ArrowSetSelectedByKeyboard
		AudioCore.PlayEffect(0)
	elif InputCore.JoystickDirection[0] == InputCore.JoyUp && NumberOfArrowSetsOnScreen > 1:
		if ArrowSetSelectedByKeyboard > 0:
			ArrowSetSelectedByKeyboard-=1
		else:  ArrowSetSelectedByKeyboard = (NumberOfArrowSetsOnScreen-1)

		ArrowSetSelectedByKeyboardLast = ArrowSetSelectedByKeyboard
		VisualsCore.Sprites.SpriteImage[60].global_position = Vector2((VisualsCore.ScreenWidth/2), ArrowSets.ArrowSetScreenY[ArrowSetSelectedByKeyboard])
		AudioCore.PlayEffect(0)
		InputCore.DelayAllUserInput = 10
	elif InputCore.JoystickDirection[0] == InputCore.JoyDown && NumberOfArrowSetsOnScreen > 1:
		if ArrowSetSelectedByKeyboard < (NumberOfArrowSetsOnScreen-1):
			ArrowSetSelectedByKeyboard+=1
		else:  ArrowSetSelectedByKeyboard = 0

		ArrowSetSelectedByKeyboardLast = ArrowSetSelectedByKeyboard
		VisualsCore.Sprites.SpriteImage[60].global_position = Vector2((VisualsCore.ScreenWidth/2), ArrowSets.ArrowSetScreenY[ArrowSetSelectedByKeyboard])
		AudioCore.PlayEffect(0)
		InputCore.DelayAllUserInput = 10
	pass

#----------------------------------------------------------------------------------------
func CreateIcon(var spriteIndex, var screenX, var screenY, var text):
	Icons.IconIndex[NumberOfIconsOnScreen] = NumberOfIconsOnScreen
	Icons.IconSprite[NumberOfIconsOnScreen] = spriteIndex
	Icons.IconScreenX[NumberOfIconsOnScreen] = screenX
	Icons.IconScreenY[NumberOfIconsOnScreen] = screenY
	Icons.IconAnimationTimer[NumberOfIconsOnScreen] = -1
	Icons.IconScale[NumberOfIconsOnScreen] = 1.0
	Icons.IconText[NumberOfIconsOnScreen] = text

	NumberOfIconsOnScreen+=1

	pass

#----------------------------------------------------------------------------------------
func DrawAllIcons():
	for index in range (0, NumberOfIconsOnScreen):
		VisualsCore.Sprites.SpriteImage[Icons.IconSprite[index]].global_position = Vector2(Icons.IconScreenX[index], Icons.IconScreenY[index])

		if Icons.IconAnimationTimer[index] == 3:
			VisualsCore.Sprites.SpriteImage[Icons.IconSprite[index]].scale = Vector2(0.85, 0.85)
		elif Icons.IconAnimationTimer[index] == 2:
			VisualsCore.Sprites.SpriteImage[Icons.IconSprite[index]].scale = Vector2(0.90, 0.90)
		elif Icons.IconAnimationTimer[index] == 1:
			VisualsCore.Sprites.SpriteImage[Icons.IconSprite[index]].scale = Vector2(0.95, 0.95)
		elif Icons.IconAnimationTimer[index] == 0:
			VisualsCore.Sprites.SpriteImage[Icons.IconSprite[index]].scale = Vector2(1.0, 1.0)
	pass

#----------------------------------------------------------------------------------------
func ThisIconWasPressed(var iconToCheck):
	var sprH
	var sprW

	if NumberOfIconsOnScreen == 0:  return false
	
	if Icons.IconAnimationTimer[iconToCheck] == 3:
		Icons.IconAnimationTimer[iconToCheck]-=1
	elif Icons.IconAnimationTimer[iconToCheck] == 2:
		Icons.IconAnimationTimer[iconToCheck]-=1
	elif Icons.IconAnimationTimer[iconToCheck] == 1:
		Icons.IconAnimationTimer[iconToCheck]-=1
	elif Icons.IconAnimationTimer[iconToCheck] == 0:
		Icons.IconAnimationTimer[iconToCheck] = -1
		return true
	
	if InputCore.DelayAllUserInput > 0:  return false

#	for index in range (0, NumberOfIconsOnScreen):
	if InputCore.MouseButtonLeftPressed == true:
		sprH = (VisualsCore.Sprites.SpriteImage[Icons.IconSprite[iconToCheck]].texture.get_height()/2)
		sprW = (VisualsCore.Sprites.SpriteImage[Icons.IconSprite[iconToCheck]].texture.get_width()/2)

		if (iconToCheck == 1):
			print(sprH)

		if (InputCore.MouseScreenY > (Icons.IconScreenY[iconToCheck]-sprH) && InputCore.MouseScreenY < (Icons.IconScreenY[iconToCheck]+sprH) && InputCore.MouseScreenX > (Icons.IconScreenX[iconToCheck]-sprW) && InputCore.MouseScreenX < (Icons.IconScreenX[iconToCheck]+sprW)):
			Icons.IconAnimationTimer[iconToCheck] = 3

			AudioCore.PlayEffect(0)
			InputCore.DelayAllUserInput = 30

	return false

	pass

#----------------------------------------------------------------------------------------
func DeleteAllGUI():
	ButtonSelectedByKeyboard = 0

	for index in range (0, NumberOfButtonsOnScreen):
		Buttons.ButtonIndex[index] = -1
		Buttons.ButtonScreenX[index] = -99999
		Buttons.ButtonScreenY[index] = -99999
		Buttons.ButtonAnimationTimer[index] = -1
		Buttons.ButtonScale[index] = 1.0

	NumberOfButtonsOnScreen = 0
	ArrowSetSelectedByKeyboard = 0

	for index in range (0, NumberOfArrowSetsOnScreen):
		ArrowSets.ArrowSetIndex[index] = -1
		ArrowSets.ArrowSetScreenY[index] = -99999
		ArrowSets.ArrowSetLeftAnimationTimer[index] = 0
		ArrowSets.ArrowSetRightAnimationTimer[index] = 0
		ArrowSets.ArrowSetLeftScale[index] = 1.0
		ArrowSets.ArrowSetRightScale[index] = 1.0

	NumberOfArrowSetsOnScreen = 0

	for index in range(0, NumberOfIconsOnScreen):
		Icons.IconIndex[index] = -1
		Icons.IconSprite[index] = -1
		Icons.IconScreenX[index] = -99999
		Icons.IconScreenY[index] = -99999
		Icons.IconAnimationTimer[index] = -1
		Icons.IconScale[index] = 1.0
		Icons.IconText[index] = " "

	NumberOfIconsOnScreen = 0

	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	pass
