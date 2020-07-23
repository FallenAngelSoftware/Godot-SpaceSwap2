# "VisualsCore.gd"
extends Node

var DEBUG = true

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

var FontTTF = []

var TextCurrentIndex;

class TextClass:
	var TextImage = []
	var TextIndex = []
	var TextScreenX = []
	var TextScreenY = []
	var TextHorizontalJustification = []
	var TextSize = []
	var TextScaleX = []
	var TextScaleY = []
	var TextRotation = []
	var TextColorRed  = []
	var TextColorGreen = []
	var TextColorBlue = []
	var TextColorAlpha = []
	var TextOutlineRed = []
	var TextOutlineGreen = []
	var TextOutlineBlue = []
var Texts = TextClass.new()


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

	Sprites.SpriteImage[10].set_texture(preload("res://media/images/backgrounds/TitleBG.png"))
	Sprites.SpriteActive[10] = true
	
	Sprites.SpriteImage[20].set_texture(preload("res://media/images/logos/Logo.png"))
	Sprites.SpriteActive[20] = true

	Sprites.SpriteImage[25].set_texture(preload("res://media/images/logos/GooglePlayLogo.png"))
	Sprites.SpriteActive[25] = true

	Sprites.SpriteImage[30].set_texture(preload("res://media/images/gui/ScreenLine.png"))
	Sprites.SpriteActive[30] = true
	Sprites.SpriteImage[31].set_texture(preload("res://media/images/gui/ScreenLine.png"))
	Sprites.SpriteActive[31] = true
	Sprites.SpriteImage[32].set_texture(preload("res://media/images/gui/ScreenLine.png"))
	Sprites.SpriteActive[32] = true
	Sprites.SpriteImage[33].set_texture(preload("res://media/images/gui/ScreenLine.png"))
	Sprites.SpriteActive[33] = true
	Sprites.SpriteImage[34].set_texture(preload("res://media/images/gui/ScreenLine.png"))
	Sprites.SpriteActive[34] = true

	Sprites.SpriteImage[40].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[40] = true
	Sprites.SpriteImage[41].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[41] = true
	Sprites.SpriteImage[42].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[42] = true
	Sprites.SpriteImage[43].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[43] = true
	Sprites.SpriteImage[44].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[44] = true
	Sprites.SpriteImage[45].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[45] = true
	Sprites.SpriteImage[46].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[46] = true
	Sprites.SpriteImage[47].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[47] = true
	Sprites.SpriteImage[48].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[48] = true
	Sprites.SpriteImage[49].set_texture(preload("res://media/images/gui/Button.png"))
	Sprites.SpriteActive[49] = true

	Sprites.SpriteImage[50].set_texture(preload("res://media/images/gui/ButtonSelectorLeft.png"))
	Sprites.SpriteActive[50] = true
	Sprites.SpriteImage[51].set_texture(preload("res://media/images/gui/ButtonSelectorRight.png"))
	Sprites.SpriteActive[51] = true
	
	for index in range(0, 1000):
		if Sprites.SpriteActive[index] == true:
			add_child(Sprites.SpriteImage[index])
			Sprites.SpriteImage[index].global_position = Vector2(Sprites.SpriteScreenX[index], Sprites.SpriteScreenY[index])

	FontTTF.append(DynamicFont.new())
	FontTTF[0].font_data = load("res://media/fonts/LiberationSans-Regular.ttf")
	FontTTF[0].size = 25
	FontTTF.append(DynamicFont.new())
	FontTTF[1].font_data = load("res://media/fonts/LiberationSans-Regular.ttf")
	FontTTF[1].size = 60

	TextCurrentIndex = 0

	pass


#----------------------------------------------------------------------------------------
func MoveAllActiveSpritesOffScreen():
	for index in range(1, 1000):
		if Sprites.SpriteActive[index] == true:
			Sprites.SpriteImage[index].global_position = Vector2(-9999, -9999)

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
func DeleteAllTexts():
	var size = Texts.TextImage.size()
	size-=1

	for index in range(size, 9, -1):
		remove_child(Texts.TextImage[index])
		Texts.TextImage.remove(index)
#		Texts.TextImage[index].queue_free()

	TextCurrentIndex = 10

	pass


#----------------------------------------------------------------------------------------
func DrawnTextChangeScaleRotation(var index, var scaleX, var scaleY, var rotation):
	Texts.TextImage[index].rect_scale = Vector2(scaleX, scaleY)
	Texts.TextImage[index].rect_rotation = rotation

	pass


#----------------------------------------------------------------------------------------
func DrawText(var index, var text, var x, var y, var horizontalJustification, var fontSize, var scaleX, var scaleY, var rotation, var red, var green, var blue, var alpha, var outlineRed, var outlineGreen, var outlineBlue):
	Texts.TextImage.append(RichTextLabel.new())

	add_child(Texts.TextImage[index])

	var fontToUseIndex = 0
	if fontSize == 25:
		fontToUseIndex = 0
	elif fontSize == 60:
		fontToUseIndex = 1

	Texts.TextImage[index].add_font_override("normal_font", FontTTF[fontToUseIndex])

	Texts.TextImage[index].modulate = Color(red, green, blue, alpha)
	
	FontTTF[fontToUseIndex].outline_size = 3
	FontTTF[fontToUseIndex].outline_color = Color(outlineRed, outlineGreen, outlineBlue, alpha)

	Texts.TextImage[index].text = text

	var textWidth = Texts.TextImage[index].get_font("normal_font").get_string_size(Texts.TextImage[index].text).x
	var textHeight = Texts.TextImage[index].get_font("normal_font").get_string_size(Texts.TextImage[index].text).y

	Texts.TextImage[index].rect_global_position.x = x
	Texts.TextImage[index].rect_global_position.y = (y - (textHeight / 2))

	Texts.TextImage[index].set_size(Vector2(ScreenWidth, ScreenHeight), false)

	Texts.TextImage[index].rect_pivot_offset = Vector2((textWidth / 2), (textHeight / 2))

	Texts.TextImage[index].rect_scale = Vector2(scaleX, scaleY)

	Texts.TextImage[index].rect_rotation = rotation

	if horizontalJustification == 0:
		Texts.TextImage[index].ALIGN_LEFT
	elif horizontalJustification == 1:
		Texts.TextImage[index].ALIGN_CENTER
		Texts.TextImage[index].rect_global_position.x = ((VisualsCore.ScreenWidth/2) - (textWidth / 2))
	elif horizontalJustification == 2:
		Texts.TextImage[index].ALIGN_LEFT
		Texts.TextImage[index].rect_global_position.x = (VisualsCore.ScreenWidth - x - (textWidth))
	elif horizontalJustification == 4:
		Texts.TextImage[index].ALIGN_LEFT
		Texts.TextImage[index].rect_global_position.x = (x - (textWidth / 2))
	else:  Texts.TextImage[index].ALIGN_FILL

	Texts.TextIndex.append(index)
	Texts.TextScreenX.append(x)
	Texts.TextScreenY.append(y)
	Texts.TextHorizontalJustification.append(horizontalJustification)
	Texts.TextSize.append(fontSize)
	Texts.TextScaleX.append(scaleX)
	Texts.TextScaleY.append(scaleY)
	Texts.TextRotation.append(rotation)
	Texts.TextColorRed.append(red)
	Texts.TextColorGreen.append(green)
	Texts.TextColorBlue.append(blue)
	Texts.TextColorAlpha.append(alpha)
	Texts.TextOutlineRed.append(outlineRed)
	Texts.TextOutlineGreen.append(outlineGreen)
	Texts.TextOutlineBlue.append(outlineBlue)

	TextCurrentIndex+=1

	pass
