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

class AboutText:
	var AboutTextsText = []
#	var AboutTextsScreenY = []
	var AboutTextsBlue = []
var AboutTexts = AboutText.new()

var AboutTextsStartIndex
var AboutTextsEndIndex


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

	Sprites.SpriteImage[5].set_texture(preload("res://media/images/logos/GodotLogo.png"))
	Sprites.SpriteActive[5] = true

	Sprites.SpriteImage[10].set_texture(preload("res://media/images/backgrounds/TitleBG.png"))
	Sprites.SpriteActive[10] = true
	
	Sprites.SpriteImage[20].set_texture(preload("res://media/images/logos/Logo.png"))
	Sprites.SpriteActive[20] = true

	Sprites.SpriteImage[25].set_texture(preload("res://media/images/logos/GooglePlayLogo.png"))
	Sprites.SpriteActive[25] = true

	
	for index in range(30, 35):
		Sprites.SpriteImage[index].set_texture(preload("res://media/images/gui/ScreenLine.png"))
		Sprites.SpriteActive[index] = true


	for index in range(40, 50):
		Sprites.SpriteImage[index].set_texture(preload("res://media/images/gui/Button.png"))
		Sprites.SpriteActive[index] = true


	Sprites.SpriteImage[50].set_texture(preload("res://media/images/gui/ButtonSelectorLeft.png"))
	Sprites.SpriteActive[50] = true
	Sprites.SpriteImage[51].set_texture(preload("res://media/images/gui/ButtonSelectorRight.png"))
	Sprites.SpriteActive[51] = true


#	for index in range(60, 70):
	Sprites.SpriteImage[60].set_texture(preload("res://media/images/gui/SelectorLine.png"))
	Sprites.SpriteActive[60] = true

	for index in range(80, 90, 2):
		Sprites.SpriteImage[index].set_texture(preload("res://media/images/gui/ButtonSelectorLeft.png"))
		Sprites.SpriteActive[index] = true
		Sprites.SpriteImage[index+1].set_texture(preload("res://media/images/gui/ButtonSelectorRight.png"))
		Sprites.SpriteActive[index+1] = true


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

	AboutTextsStartIndex = 0
	AboutTextsEndIndex = 0


	Sprites.SpriteImage[60].scale = Vector2(2.845, 1.0)
	Sprites.SpriteImage[60].modulate = Color(1.0, 1.0, 1.0, 0.4)
	

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


#----------------------------------------------------------------------------------------
func AddAboutScreenText(var text, var blue):
	AboutTexts.AboutTextsText.append(text)
	AboutTexts.AboutTextsBlue.append(blue)

	AboutTextsEndIndex+=1


	pass


#----------------------------------------------------------------------------------------
func LoadAboutScreenTexts():
	AboutTextsStartIndex = 10
	AboutTextsEndIndex = AboutTextsStartIndex

	AddAboutScreenText("TM", 0.0)
	AddAboutScreenText("''Space Swap™ 2''", 0.0)
	AddAboutScreenText("©2021 By Team ''www.FallenAngelSoftware.com''", 1.0)

	AddAboutScreenText("Original Concept By:", 0.0)
	AddAboutScreenText("Nintendo", 1.0)

	AddAboutScreenText("Made With 100% FREE ''Godot Game engine'':", 0.0)
	AddAboutScreenText("(www.GodotEngine.org)", 1.0)

	AddAboutScreenText("Game Built On:", 0.0)
	AddAboutScreenText("Genuine ''openSUSE Tumbleweed KDE 64Bit'' Linux", 1.0)
	AddAboutScreenText("(www.openSUSE.org)", 1.0)
	AddAboutScreenText("Real Programmers Use Linux!", 1.0)

	AddAboutScreenText("Project Directed By:", 0.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("''Godot'' 2-D Game Engine Framework:", 0.0)
	AddAboutScreenText("The ''Grand National GNX'' Engine", 1.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("Lead Game Designer:", 0.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("Lead Game Programmer:", 0.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("Lead Game Tester:", 0.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("Support Game Programmers:", 0.0)
	AddAboutScreenText("''Daotheman''", 1.0)
	AddAboutScreenText("''theweirdn8''", 1.0)
	AddAboutScreenText("''mattmatteh''", 1.0)

	AddAboutScreenText("Lead Graphic Artist:", 0.0)
	AddAboutScreenText("''Oshi Bobo''", 1.0)
	AddAboutScreenText("(www.OshiBobo.com)", 1.0)
	AddAboutScreenText("- For Hire Graphic Artist -", 1.0)

	AddAboutScreenText("Support Graphic Artist:", 0.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("Lead Music Artist:", 0.0)
	AddAboutScreenText("''D.J. Fading Twilight''", 1.0)

	AddAboutScreenText("Sound Effects Compiled & Edited By:", 0.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("''Neo's Kiss'' Graphical User Interface By:", 0.0)
	AddAboutScreenText("''JeZxLee''", 1.0)

	AddAboutScreenText("PNG Graphics Edited In:", 0.0)
	AddAboutScreenText("''NeoPaint''", 1.0)
	AddAboutScreenText("(www.NeoSoftware.com/NPW.html)", 1.0)

	AddAboutScreenText("PNG Graphics Optimized Using:", 0.0)
	AddAboutScreenText("''TinyPNG''", 1.0)
	AddAboutScreenText("(www.TinyPNG.com)", 1.0)

	AddAboutScreenText("OGG Audio Edited In:", 0.0)
	AddAboutScreenText("''GoldWave''", 1.0)
	AddAboutScreenText("(www.GoldWave.com)", 1.0)

	AddAboutScreenText("OGG Audio Optimized Using:", 0.0)
	AddAboutScreenText("''OGGResizer''", 1.0)
	AddAboutScreenText("(www.SkyShape.com)", 1.0)

	AddAboutScreenText("''Space Swap 2'' Logo Created In:", 0.0)
	AddAboutScreenText("Genuine M.S. Office 365 Publisher", 1.0)
	AddAboutScreenText("(www.Office.com)", 1.0)

#	AddAboutScreenText("Game Created On A:", 0.0)
#	AddAboutScreenText("Hyper-Custom ''JeZxLee'' Pro-Built Desktop", 1.0)
#	AddAboutScreenText("Desktop Code Name: ''Optimus Prime''", 1.0)
#	AddAboutScreenText("Genuine ''openSUSE Tumbleweed KDE 64Bit'' Linux", 1.0)
#	AddAboutScreenText("Corsair® 750watt Modular Power Supply", 1.0)
#	AddAboutScreenText("GIGABYTE® GA-970A-DS3P 2.0 AM3+ Motherboard", 1.0)
#	AddAboutScreenText("AMD® FX 3.5GHz(4GHz Turbo) 8-Core CPU", 1.0)
#	AddAboutScreenText("Corsair® 32GB DDR3 RAM Memory", 1.0)
#	AddAboutScreenText("nVidia® GeForce GTX 970TT 4GB GDDR5 GPU", 1.0)
#	AddAboutScreenText("ADATA® 1TB SSD Hard Drive(OS/Apps)", 1.0)
#	AddAboutScreenText("Western Digital® 1TB HDD Hard Drive(Personal Data)", 1.0)
	AddAboutScreenText("Game Created On A:", 0.0)
	AddAboutScreenText("Hyper-Custom ''JeZxLee'' Pro-Built Desktop", 1.0)
	AddAboutScreenText("Desktop Code Name: ''JetFire''", 1.0)
	AddAboutScreenText("Genuine ''openSUSE Tumbleweed K.D.E. 64Bit'' Linux", 1.0)
	AddAboutScreenText("Thermaltake 500watt Power Supply", 1.0)
	AddAboutScreenText("Gigabye B85M-HD3 Mid-Range Motherboard", 1.0)
	AddAboutScreenText("Intel Core i5 3.0GHz(3.2GHz Turbo) 4-Core CPU", 1.0)
	AddAboutScreenText("Corsair 16GB DDR3 RAM Memory", 1.0)
	AddAboutScreenText("nVidia GeForce GTX 1050 Ti 4GB GDDR5 GPU", 1.0)
	AddAboutScreenText("ADATA 1TB SSD Hard Drive(OS/Apps)", 1.0)
	AddAboutScreenText("Western Digital 1TB HDD Hard Drive(Personal Data)", 1.0)

	AddAboutScreenText("HTML5 Version Tested On:", 0.0)
	AddAboutScreenText("Genuine Windows® 10 Pro 64Bit", 1.0)
	AddAboutScreenText("Edge", 1.0)
	AddAboutScreenText("Firefox", 1.0)
	AddAboutScreenText("Chrome", 1.0)
	AddAboutScreenText("Opera", 1.0)

	AddAboutScreenText("Android Version Tested On:", 0.0)
	AddAboutScreenText("Samsung® Galaxy S7 Edge Smartphone", 1.0)
	AddAboutScreenText("Onn® Android 10.1'' 16GB Tablet", 1.0)

	AddAboutScreenText("Big Thank You To People Who Helped:", 0.0)
	AddAboutScreenText("''TwistedTwigleg''", 1.0)
	AddAboutScreenText("''Megalomaniak", 1.0)
	AddAboutScreenText("''SIsilicon28''", 1.0)
	AddAboutScreenText("''vimino''", 1.0)
	AddAboutScreenText("(: ''Purple Conditioner'' :)", 1.0)
	AddAboutScreenText("''Kequc''", 1.0)
	AddAboutScreenText("''qeed''", 1.0)
	AddAboutScreenText(" ", 1.0)
	AddAboutScreenText("''You!''", 1.0)

	AddAboutScreenText("''A 110% By Team Fallen Angel Software!''", 0.0)
	AddAboutScreenText("(www.FallenAngelSoftware.com)", 1.0)

	DrawText(AboutTextsStartIndex, AboutTexts.AboutTextsText[AboutTextsStartIndex-10], ((ScreenWidth/2)+100), ScreenHeight+25, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, AboutTexts.AboutTextsBlue[AboutTextsStartIndex-10], 0.0, 0.0, 0.0, 0.0)

	var screenY = ScreenHeight+25
	for index in range(AboutTextsStartIndex+1, AboutTextsEndIndex):
		if (AboutTexts.AboutTextsBlue[index-10] == 1.0 && AboutTexts.AboutTextsBlue[index-1-10] == 0.0):
			screenY+=40
		elif (AboutTexts.AboutTextsBlue[index-10] == 1.0 && AboutTexts.AboutTextsBlue[index-1-10] == 1.0):
			screenY+=40
		else:
			screenY+=110

		DrawText(index, AboutTexts.AboutTextsText[index-10], 0, screenY, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, AboutTexts.AboutTextsBlue[index-10], 1.0, 0.0, 0.0, 0.0)

	Texts.TextImage[AboutTextsEndIndex-2].rect_global_position.y+=(ScreenHeight/2)
	Texts.TextImage[AboutTextsEndIndex-1].rect_global_position.y+=(ScreenHeight/2)


	pass

