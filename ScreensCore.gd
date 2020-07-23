# "ScreensCore.gd"
extends Node

const FadingIdle			= -1
const FadingFromBlack		= 0
const FadingToBlack			= 1
var ScreenFadeStatus
var ScreenFadeTransparency

var ScreenDisplayTimer

const GodotScreen			= 0
const FASScreen				= 1
const TitleScreen			= 2
const OptionsScreen			= 3
const HowToPlayScreen		= 4
const HighScoresScreen		= 5
const AboutScreen			= 6

var ScreenToDisplay
var ScreenToDisplayNext


func _ready():
	ScreenFadeStatus = FadingFromBlack
	ScreenFadeTransparency = 1.0

	ScreenToDisplay = FASScreen
	ScreenToDisplayNext = TitleScreen

	pass


func _process(delta):

	pass


func ApplyScreenFadeTransition():	
	if ScreenFadeStatus == FadingFromBlack:
		if ScreenFadeTransparency > 0.0:
			ScreenFadeTransparency-=0.1
		else:
			ScreenFadeTransparency = 0.0
			ScreenFadeStatus = FadingIdle
	elif ScreenFadeStatus == FadingToBlack:
		if ScreenFadeTransparency < 1.0:
			ScreenFadeTransparency+=0.1
		else:
			ScreenFadeTransparency = 1.0
			ScreenFadeStatus = FadingFromBlack
			
			print(VisualsCore.Texts.TextImage.size())

			VisualsCore.MoveAllActiveSpritesOffScreen()
			VisualsCore.DeleteAllTexts()
			InterfaceCore.InitializeButtons()

			print(VisualsCore.Texts.TextImage.size())

			ScreenToDisplay = ScreenToDisplayNext
	
	VisualsCore.Sprites.SpriteImage[0].modulate = Color(1.0, 1.0, 1.0, ScreenFadeTransparency)
	
	pass


func DisplayFASScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.3, 0.3, 0.3, 1.0))

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "''Space Swap™ 2''", 0, 16, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, LogicCore.Version, 0, 16+30, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "©2020 By Team ''www.FallenAngelSoftware.com''", 0, 16+(30*2), 1, 16+30+30, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(30, VisualsCore.ScreenWidth/2, 16+(30*3), 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Target Platforms:", 0, 16+(30*4), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "- Windows/macOS/Linux Desktop/Laptop HTML5 Internet Browsers -", 0, 16+(30*5), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "- Android Smartphones/Tablets -", 0, 16+(30*6), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "- Nintendo Switch/Switch Lite Consoles/Handhelds -", 0, 16+(30*7), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(31, VisualsCore.ScreenWidth/2, 16+(30*8), 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Game Engine:", 0, 16+(30*9), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "- JeZxLee's ''Grand National GNX'' Godot 3.x 2-D Video Game Engine -", 0, 16+(30*10), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "www.GodotEngine.org", 0, 16+(30*11), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(32, VisualsCore.ScreenWidth/2, 16+(30*12), 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "THIS IS ONLY A DEMO!", 0, 490, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawnTextChangeScaleRotation(VisualsCore.TextCurrentIndex-1, 3.3, 3.3, 0)

		VisualsCore.DrawSprite(33, VisualsCore.ScreenWidth/2, 640-48, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Click Left Mouse Button Or Press Keyboard [Spacebar] To Continue!", 0, 640-25, 1, 16+30+30, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		ScreenDisplayTimer = 750

	if InputCore.MouseButtonLeftPressed == true || InputCore.KeyboardSpacebarPressed == true:
		ScreenDisplayTimer = 1

	if 	ScreenDisplayTimer > 1:
		ScreenDisplayTimer-=1
	else:
		ScreenToDisplayNext = TitleScreen
		ScreenFadeStatus = FadingToBlack
		ScreenDisplayTimer = -1

#	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 1.0:
#		VisualsCore.DeleteAllTexts()
#		ScreenToDisplay = TitleScreen
#		ScreenFadeStatus = FadingFromBlack
	pass


func DisplayTitleScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 0.9:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		
		VisualsCore.DrawSprite(10, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, LogicCore.Version, 0, 12, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(20, VisualsCore.ScreenWidth/2, 82, 1.75, 1.0, 0, 1.0, 1.0, 1.0, 1.0)

		VisualsCore.DrawSprite(30, VisualsCore.ScreenWidth/2, 150, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "#1 Top Player ''JeZxLee'' Scored: 10000", 0, 170, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(31, VisualsCore.ScreenWidth/2, 194, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		var buttonY = 223
		var buttonOffsetY = 41
		InterfaceCore.CreateButton (0, (VisualsCore.ScreenWidth/2), (buttonY))
		buttonY+=buttonOffsetY
		InterfaceCore.CreateButton (1, (VisualsCore.ScreenWidth/2), (buttonY))
		buttonY+=buttonOffsetY
		InterfaceCore.CreateButton (2, (VisualsCore.ScreenWidth/2), (buttonY))
		buttonY+=buttonOffsetY
		InterfaceCore.CreateButton (3, (VisualsCore.ScreenWidth/2), (buttonY))
		buttonY+=buttonOffsetY
		InterfaceCore.CreateButton (4, (VisualsCore.ScreenWidth/2), (buttonY))
		buttonY+=buttonOffsetY
		InterfaceCore.CreateButton (5, (VisualsCore.ScreenWidth/2), (buttonY))
		buttonY+=buttonOffsetY
#		InterfaceCore.CreateButton (8, (VisualsCore.ScreenWidth/2), (buttonY))
#		buttonY+=buttonOffsetY

		VisualsCore.DrawSprite(25, VisualsCore.ScreenWidth/2, 540, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0)

		VisualsCore.DrawSprite(32, VisualsCore.ScreenWidth/2, 602, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "©2021 By Team ''www.FallenAngelSoftware.com''", 0, 640-19, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

#	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 1.0:
#		VisualsCore.DeleteAllTexts()
#		ScreenToDisplay = TitleScreen
#		ScreenFadeStatus = FadingFromBlack
	pass
	

func ProcessScreenToDisplay():

	if ScreenToDisplay == FASScreen:
		DisplayFASScreen()
	elif ScreenToDisplay == TitleScreen:
		DisplayTitleScreen()


	InterfaceCore.DrawAllButtons()

	ApplyScreenFadeTransition()

	pass
