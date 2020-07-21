# "VisualsCore.gd"
extends Node

var ScreenWidth = 1024
var ScreenHeight = 640

class SpriteClass:
	var SpriteImage = []
	var SpriteActive = []
	var SpriteScreenX = []
	var SpriteScreenY = []
	var SpriteScaleX = []
	var SpriteScaleY = []
	var SpriteRotation = []
	var SpriteColorRed = []
	var SpriteColorGreen = []
	var SpriteColorBlue = []
	var SpriteColorAlpha = []
var Sprites = SpriteClass.new()

#class TextClass:
#	var TextImage = []
#	var TextIndex = []
#	var TextScreenX = []
#	var TextScreenY = []
#	var TextHorizontalJustification = []
#	var TextSize = []
#	var TextScaleX = []
#	var TextScaleY = []
#	var TextRotation = []
#	var TextColorRed  = []
#	var TextColorGreen = []
#	var TextColorBlue = []
#	var TextColorAlpha = []
#	var TextOutlineRed = []
#	var TextOutlineGreen = []
#	var TextOutlineBlue = []
#var Texts = TextClass.new()


#----------------------------------------------------------------------------------------
func _ready():
	for index in range(0, 1000):
		Sprites.SpriteImage.append(Sprite.new())
		Sprites.SpriteActive.append(false)
		Sprites.SpriteScreenX.append(-99999)
		Sprites.SpriteScreenY.append(-99999)
		Sprites.SpriteScaleX.append(1.0)
		Sprites.SpriteScaleY.append(1.0)
		Sprites.SpriteRotation.append(0)
		Sprites.SpriteColorRed.append(1.0)
		Sprites.SpriteColorGreen.append(1.0)
		Sprites.SpriteColorBlue.append(1.0)
		Sprites.SpriteColorAlpha.append(1.0)
	
	Sprites.SpriteImage[0].set_texture(preload("res://media/images/backgrounds/FadingBlackBG.png"))
	Sprites.SpriteActive[0] = true

	Sprites.SpriteImage[1].set_texture(preload("res://media/images/backgrounds/TitleBG.png"))
	Sprites.SpriteActive[1] = true
	
	Sprites.SpriteImage[2].set_texture(preload("res://media/images/logos/Logo.png"))
	Sprites.SpriteActive[2] = true

	Sprites.SpriteImage[3].set_texture(preload("res://media/images/gui/ScreenLine.png"))
	Sprites.SpriteActive[3] = true

	
	for index in range(0, 1000):
		if Sprites.SpriteActive[index] == true:
			add_child(Sprites.SpriteImage[index])
			Sprites.SpriteImage[index].global_position = Vector2(Sprites.SpriteScreenX[index], Sprites.SpriteScreenY[index])

	pass

#----------------------------------------------------------------------------------------
func DrawSprite(var index, var x, var y, var scaleX, var scaleY, var rotation, var red, var green, var blue, var alpha):
	Sprites.SpriteImage[index].global_position = Vector2(x, y)
	Sprites.SpriteImage[index].scale = Vector2(scaleX, scaleY)
	Sprites.SpriteImage[index].rotation = deg2rad(rotation)
	Sprites.SpriteImage[index].modulate = Color(red, green, blue, alpha)

	Sprites.SpriteActive[index] = true
	Sprites.SpriteScreenX[index] = x
	Sprites.SpriteScreenY[index] = y
	Sprites.SpriteScaleX[index] = scaleX
	Sprites.SpriteScaleY[index] = scaleY
	Sprites.SpriteRotation[index] = rotation
	Sprites.SpriteColorRed[index] = red
	Sprites.SpriteColorGreen[index] = green
	Sprites.SpriteColorBlue[index] = blue
	Sprites.SpriteColorAlpha[index] = alpha

	pass

#----------------------------------------------------------------------------------------
func DrawText(var index, var x, var y, var horizontalJustification, var size, var scaleX, var scaleY, var rotation, var red, var green, var blue, var alpha, var outlineRed, var outlineGreen, var outlineBlue):

#	var RTL = RichTextLabel.new()
#
#	var FONT = DynamicFont.new()
#	FONT.font_data = load("res://media/fonts/LiberationSans-Regular.ttf")
#	FONT.size = 25
#
#
#	for index in range(0, 1000):
#		Texts.TextImage[index].append(null)

#	var TextImage = []
#	var TextIndex = []
#	var TextScreenX = []
#	var TextScreenY = []
#	var TextHorizontalJustification = []
#	var TextSize = []
#	var TextScaleX = []
#	var TextScaleY = []
#	var TextRotation = []
#	var TextColorRed = []
#	var TextColorGreen = []
#	var TextColorBlue = []
#	var TextColorAlpha = []
#	var TextOutlineRed = []
#	var TextOutlineGreen = []
#	var TextOutlineBlue = []
#var Texts = TextClass.new()

#	if Sprites.SpriteActive[index] == false:  return false
#	
#	Sprites.SpriteImage[index].global_position = Vector2(x, y)
#	Sprites.SpriteImage[index].scale = Vector2(scaleX, scaleY)
#	Sprites.SpriteImage[index].rotation = deg2rad(rotation)
#	Sprites.SpriteImage[index].modulate = Color(red, green, blue, alpha)
#
#	Sprites.SpriteScreenX[index] = x
#	Sprites.SpriteScreenY[index] = y
#	Sprites.SpriteScaleX[index] = scaleX
#	Sprites.SpriteScaleY[index] = scaleY
#	Sprites.SpriteRotation[index] = rotation
#	Sprites.SpriteColorRed[index] = red
#	Sprites.SpriteColorGreen[index] = green
#	Sprites.SpriteColorBlue[index] = blue
#	Sprites.SpriteColorAlpha[index] = alpha

	pass
