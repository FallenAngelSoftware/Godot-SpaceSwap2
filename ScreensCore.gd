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
const MusicTestScreen		= 7

var ScreenToDisplay
var ScreenToDisplayNext

const OSWindows				= 1
const OSHTMLFive			= 2
const OSAndroid				= 3
var OperatingSys = 0

#----------------------------------------------------------------------------------------
func _ready():
	ScreenFadeStatus = FadingFromBlack
	ScreenFadeTransparency = 1.0

	ScreenToDisplay = GodotScreen
	ScreenToDisplayNext = FASScreen

	if OS.get_name() == "Windows":
		OperatingSys = OSWindows
	elif OS.get_name() == "HTML5":
		OperatingSys = OSHTMLFive
	elif OS.get_name() == "Android":
		OperatingSys = OSAndroid

	OperatingSys = OSAndroid

	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	pass

#----------------------------------------------------------------------------------------
func ApplyScreenFadeTransition():	
	if ScreenFadeStatus == FadingFromBlack:
		if ScreenFadeTransparency > 0.25:
			ScreenFadeTransparency-=0.25
		else:
			ScreenFadeTransparency = 0.0
			ScreenFadeStatus = FadingIdle
	elif ScreenFadeStatus == FadingToBlack:
		if ScreenFadeTransparency < 0.75:
			ScreenFadeTransparency+=0.25
		else:
			ScreenFadeTransparency = 1.0
			ScreenFadeStatus = FadingFromBlack
			
			VisualsCore.MoveAllActiveSpritesOffScreen()
			VisualsCore.DeleteAllTexts()
			InterfaceCore.DeleteAllGUI()
			InterfaceCore.InitializeGUI(false)

			ScreenToDisplay = ScreenToDisplayNext

	VisualsCore.Sprites.SpriteImage[0].modulate = Color(1.0, 1.0, 1.0, ScreenFadeTransparency)

	pass

#----------------------------------------------------------------------------------------
func DisplayGodotScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Made With 100% FREE:", 0, 100, 1, 60, 1.0, 1.0, 0, 0.6, 0.6, 0.6, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawSprite(5, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "www.GodotEngine.org", 0, 550, 1, 60, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		ScreenDisplayTimer = (200*2)

	if (InputCore.DelayAllUserInput == -1 && (InputCore.MouseButtonLeftPressed == true || InputCore.KeyboardSpacebarPressed == true || InputCore.KeyboardEnterPressed == true)) && ScreenDisplayTimer > 1:
		ScreenDisplayTimer = 1
		InputCore.DelayAllUserInput = 50

	if 	ScreenDisplayTimer > 1:
		ScreenDisplayTimer-=1
	elif ScreenDisplayTimer == 1:
		ScreenToDisplayNext = FASScreen
		ScreenFadeStatus = FadingToBlack
		ScreenDisplayTimer = -1
		if InputCore.MouseButtonLeftPressed == true || InputCore.KeyboardSpacebarPressed == true:  AudioCore.PlayEffect(1)

	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
		ScreenToDisplayNext = FASScreen

	pass

#----------------------------------------------------------------------------------------
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

		ScreenDisplayTimer = (750*2)

	if (InputCore.DelayAllUserInput == -1 && (InputCore.MouseButtonLeftPressed == true || InputCore.KeyboardSpacebarPressed == true || InputCore.KeyboardEnterPressed == true)) && ScreenDisplayTimer > 1:
		ScreenDisplayTimer = 1
		InputCore.DelayAllUserInput = 50

	if 	ScreenDisplayTimer > 1:
		ScreenDisplayTimer-=1
	elif ScreenDisplayTimer == 1:
		ScreenToDisplayNext = TitleScreen
		ScreenFadeStatus = FadingToBlack
		ScreenDisplayTimer = -1
		if InputCore.MouseButtonLeftPressed == true || InputCore.KeyboardSpacebarPressed == true:  AudioCore.PlayEffect(1)

	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
		ScreenToDisplayNext = TitleScreen

		AudioCore.PlayMusic(0)

	pass

#----------------------------------------------------------------------------------------
func DisplayTitleScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		VisualsCore.DrawSprite(10, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 1.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, LogicCore.Version, 0, 12, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		if (AudioCore.MusicVolume == 0.0 && AudioCore.EffectsVolume == 0.0):
			InterfaceCore.CreateIcon(110, 40, 40, " ")
		else:
			InterfaceCore.CreateIcon(111, 40, 40, " ")

		VisualsCore.DrawSprite(20, VisualsCore.ScreenWidth/2, 82, 1.75, 1.0, 0, 1.0, 1.0, 1.0, 1.0)
		VisualsCore.DrawSprite(30, VisualsCore.ScreenWidth/2, 150, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		var highScoreFullText
		highScoreFullText= "#1 Top Player ''"+DataCore.HighScoreName[LogicCore.GameMode][0]+"'' Scored: "+str(DataCore.HighScoreScore[LogicCore.GameMode][0])
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(highScoreFullText), 0, 170, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(31, VisualsCore.ScreenWidth/2, 194, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawSprite(13, 170, (VisualsCore.ScreenHeight/2)+70, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0)

#		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "XXXXXXXXXXXXXXXXX", 25, 434, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 0.2, 0.0, 0.0, 0.0)
#		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "XXXXXXXXXXXXXXXXX", 25, 300, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 0.2, 0.0, 0.0, 0.0)

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

		if (LogicCore.SecretCodeCombined == 5432 || LogicCore.SecretCodeCombined == 5431):
			InterfaceCore.CreateButton (8, (VisualsCore.ScreenWidth/2), (buttonY))
			buttonY+=buttonOffsetY

		InterfaceCore.CreateIcon(115, VisualsCore.ScreenWidth/2, 540, " ")

		VisualsCore.DrawSprite(32, VisualsCore.ScreenWidth/2, 602, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "©2021 By Team ''www.FallenAngelSoftware.com''", 0, 640-19, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		InterfaceCore.ArrowSetSelectedByKeyboardLast = -1

	if InterfaceCore.ThisIconWasPressed(0) == true:
		if (AudioCore.MusicVolume == 0.0 && AudioCore.EffectsVolume == 0.0):
			AudioCore.MusicVolume = 1.0
			AudioCore.EffectsVolume = 1.0
			VisualsCore.Sprites.SpriteImage[110].global_position = Vector2(-99999, -99999)
			InterfaceCore.Icons.IconSprite[0]  = 111
		else:
			AudioCore.MusicVolume = 0.0
			AudioCore.EffectsVolume = 0.0
			VisualsCore.Sprites.SpriteImage[111].global_position = Vector2(-99999, -99999)
			InterfaceCore.Icons.IconSprite[0]  = 110

		AudioCore.SetMusicAndEffectsVolume(AudioCore.MusicVolume, AudioCore.EffectsVolume)
		DataCore.SaveOptionsAndHighScores()
	elif InterfaceCore.ThisIconWasPressed(1) == true:
		if OperatingSys == OSWindows || OperatingSys == OSAndroid:
			OS.shell_open("https://play.google.com/store/apps/developer?id=FallenAngelSoftware.com")
		elif OperatingSys == OSHTMLFive:
			JavaScript.eval("window.location.replace('https://play.google.com/store/apps/developer?id=FallenAngelSoftware.com');")

	if InterfaceCore.ThisButtonWasPressed(0) == true:
		ScreenToDisplayNext = FASScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisButtonWasPressed(1) == true:
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisButtonWasPressed(2) == true:
		ScreenToDisplayNext = HowToPlayScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisButtonWasPressed(3) == true:
		ScreenToDisplayNext = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisButtonWasPressed(4) == true:
		ScreenToDisplayNext = AboutScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisButtonWasPressed(5) == true:
		DataCore.SaveOptionsAndHighScores()
		if OperatingSys == OSWindows || OperatingSys == OSAndroid:
			get_tree().quit()
		elif OperatingSys == OSHTMLFive:
			JavaScript.eval("window.location.replace('http://www.fallenangelsoftware.com');")

	if (LogicCore.SecretCodeCombined == 5432 || LogicCore.SecretCodeCombined == 5431):
		if InterfaceCore.ThisButtonWasPressed(6) == true:
			ScreenToDisplayNext = MusicTestScreen
			ScreenFadeStatus = FadingToBlack

			if AudioCore.MusicVolume == 0.0:
				AudioCore.MusicVolume = 1.0
				AudioCore.EffectsVolume = 1.0
				AudioCore.SetMusicAndEffectsVolume(AudioCore.MusicVolume, AudioCore.EffectsVolume)
				AudioCore.PlayMusic(0)

#	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
#		ScreenToDisplayNext = TitleScreen

	pass

#----------------------------------------------------------------------------------------
func DisplayOptionsScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		VisualsCore.DrawSprite(10, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 0.5)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "O  P  T  I  O  N  S:", 0, 12, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawSprite(30, VisualsCore.ScreenWidth/2, 30, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Music Volume:", 75, 70, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(0, 70)
		if AudioCore.MusicVolume == 1.0:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "100% Volume", 75, 70, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicVolume == 0.75:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "75% Volume", 75, 70, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicVolume == 0.5:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "50% Volume", 75, 70, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicVolume == 0.25:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "25% Volume", 75, 70, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicVolume == 0.0:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "0% Volume", 75, 70, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Sound Effects Volume:", 75, 70+50, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(1, 70+50)
		if AudioCore.EffectsVolume == 1.0:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "100% Volume", 75, 70+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.EffectsVolume == 0.75:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "75% Volume", 75, 70+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.EffectsVolume == 0.5:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "50% Volume", 75, 70+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.EffectsVolume == 0.25:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "25% Volume", 75, 70+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.EffectsVolume == 0.0:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "0% Volume", 75, 70+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(31, VisualsCore.ScreenWidth/2, 148, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Game Mode:", 75, 70+50+65, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(2, 70+50+65)
		if LogicCore.GameMode == LogicCore.ChildStoryMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Child Story Mode", 75, 70+50+65, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.TeenStoryMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Teen Story Mode", 75, 70+50+65, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.AdultStoryMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Adult Story Mode", 75, 70+50+65, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.ChildNeverEndMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Child Never Ending Mode", 75, 70+50+65, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.TeenNeverEndMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Teen Never Ending Mode", 75, 70+50+65, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.AdultNeverEndMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Adult Never Ending Mode", 75, 70+50+65, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Game Speed:", 75, 70+50+65+50, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(3, 70+50+65+50)
		if LogicCore.GameSpeed == 20:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Slow Game Speed", 75, 70+50+65+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameSpeed == 30:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Normal Game Speed", 75, 70+50+65+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameSpeed == 45:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Fast Game Speed", 75, 70+50+65+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameSpeed == 60:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Turbo! Game Speed", 75, 70+50+65+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Game Starting Level:", 75, 70+50+65+50+50, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(4, 70+50+65+50+50)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Starting Level "+str(LogicCore.StartingLevel), 75, 70+50+65+50+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(32, VisualsCore.ScreenWidth/2, 318, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Secret Code #1:", 75, 70+50+65+50+50+70, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(5, 70+50+65+50+50+70)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(LogicCore.SecretCode[0]), 75, 70+50+65+50+50+70, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Secret Code #2:", 75, 70+50+65+50+50+70+50, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(5, 70+50+65+50+50+70+50)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(LogicCore.SecretCode[1]), 75, 70+50+65+50+50+70+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Secret Code #3:", 75, 70+50+65+50+50+70+50+50, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(5, 70+50+65+50+50+70+50+50)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(LogicCore.SecretCode[2]), 75, 70+50+65+50+50+70+50+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Secret Code #4:", 75, 70+50+65+50+50+70+50+50+50, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		InterfaceCore.CreateArrowSet(5, 70+50+65+50+50+70+50+50+50)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(LogicCore.SecretCode[3]), 75, 70+50+65+50+50+70+50+50+50, 2, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		DataCore.SaveOptionsAndHighScores()

		VisualsCore.DrawSprite(33, VisualsCore.ScreenWidth/2, 583, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)
		InterfaceCore.CreateButton (6, (VisualsCore.ScreenWidth/2), VisualsCore.ScreenHeight-25)

	if InterfaceCore.ThisArrowWasPressed(0) == true:
		if AudioCore.MusicVolume > 0.0:
			AudioCore.MusicVolume-=0.25
		else:  AudioCore.MusicVolume = 1.0
		
		AudioCore.SetMusicAndEffectsVolume(AudioCore.MusicVolume, AudioCore.EffectsVolume)
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(0.5) == true:
		if AudioCore.MusicVolume < 1.0:
			AudioCore.MusicVolume+=0.25
		else:  AudioCore.MusicVolume = 0.0
		
		AudioCore.SetMusicAndEffectsVolume(AudioCore.MusicVolume, AudioCore.EffectsVolume)
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(1.0) == true:
		if AudioCore.EffectsVolume > 0.0:
			AudioCore.EffectsVolume-=0.25
		else:  AudioCore.EffectsVolume = 1.0
		
		AudioCore.SetMusicAndEffectsVolume(AudioCore.MusicVolume, AudioCore.EffectsVolume)
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(1.5) == true:
		if AudioCore.EffectsVolume < 1.0:
			AudioCore.EffectsVolume+=0.25
		else:  AudioCore.EffectsVolume = 0.0
		
		AudioCore.SetMusicAndEffectsVolume(AudioCore.MusicVolume, AudioCore.EffectsVolume)
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(2.0) == true:
		if LogicCore.GameMode > 0:
			LogicCore.GameMode-=1
		else:  LogicCore.GameMode = 5
		
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(2.5) == true:
		if LogicCore.GameMode < 5:
			LogicCore.GameMode+=1
		else:  LogicCore.GameMode = 0
		
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(3.0) == true:
		if LogicCore.GameSpeed == 60:
			LogicCore.GameSpeed = 45
		elif LogicCore.GameSpeed == 45:
			LogicCore.GameSpeed = 30
		elif LogicCore.GameSpeed == 30:
			LogicCore.GameSpeed = 20
		elif LogicCore.GameSpeed == 20:
			LogicCore.GameSpeed = 60
		
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(3.5) == true:
		if LogicCore.GameSpeed == 60:
			LogicCore.GameSpeed = 20
		elif LogicCore.GameSpeed == 45:
			LogicCore.GameSpeed = 60
		elif LogicCore.GameSpeed == 30:
			LogicCore.GameSpeed = 45
		elif LogicCore.GameSpeed == 20:
			LogicCore.GameSpeed = 30
		
		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(4.0) == true:
		if LogicCore.StartingLevel > 0:
			LogicCore.StartingLevel-=1
		else:  LogicCore.StartingLevel = LogicCore.StartingLevelForGameMode[LogicCore.GameMode]

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(4.5) == true:
		if LogicCore.StartingLevel < LogicCore.StartingLevelForGameMode[LogicCore.GameMode]:
			LogicCore.StartingLevel+=1
		else:  LogicCore.StartingLevel = 0

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(5.0) == true:
		if LogicCore.SecretCode[0] > 0:
			LogicCore.SecretCode[0]-=1
		else:  LogicCore.SecretCode[0] = 9

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(5.5) == true:
		if LogicCore.SecretCode[0] < 9:
			LogicCore.SecretCode[0]+=1
		else:  LogicCore.SecretCode[0] = 0

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(6.0) == true:
		if LogicCore.SecretCode[1] > 0:
			LogicCore.SecretCode[1]-=1
		else:  LogicCore.SecretCode[1] = 9

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(6.5) == true:
		if LogicCore.SecretCode[1] < 9:
			LogicCore.SecretCode[1]+=1
		else:  LogicCore.SecretCode[1] = 0

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(7.0) == true:
		if LogicCore.SecretCode[2] > 0:
			LogicCore.SecretCode[2]-=1
		else:  LogicCore.SecretCode[2] = 9

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(7.5) == true:
		if LogicCore.SecretCode[2] < 9:
			LogicCore.SecretCode[2]+=1
		else:  LogicCore.SecretCode[2] = 0

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(8.0) == true:
		if LogicCore.SecretCode[3] > 0:
			LogicCore.SecretCode[3]-=1
		else:  LogicCore.SecretCode[3] = 9

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(8.5) == true:
		if LogicCore.SecretCode[3] < 9:
			LogicCore.SecretCode[3]+=1
		else:  LogicCore.SecretCode[3] = 0

		ScreenToDisplayNext = OptionsScreen
		ScreenFadeStatus = FadingToBlack

	if InterfaceCore.ThisButtonWasPressed(0) == true:
		ScreenToDisplayNext = TitleScreen
		ScreenFadeStatus = FadingToBlack

	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
		LogicCore.SecretCodeCombined = (LogicCore.SecretCode[0]*1000)+(LogicCore.SecretCode[1]*100)+(LogicCore.SecretCode[2]*10)+(LogicCore.SecretCode[3]*1)

	pass

#----------------------------------------------------------------------------------------
func DisplayHowToPlayScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		VisualsCore.DrawSprite(10, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 0.5)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "H  O  W   T  O   P  L  A  Y:", 0, 12, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawSprite(30, VisualsCore.ScreenWidth/2, 30, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Objective is to keep pieces", 0, 75, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "from reaching the top.", 0, 75+30, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "As you play, new pieces", 0, 75+30+50, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "will appear at the bottom.", 0, 75+30+50+30, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Rearrange the pieces horizontally", 0, 75+30+50+30+50, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "into sets of 3 or more.", 0, 75+30+50+30+50+30, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "3 or more same pieces horizontally", 0, 75+30+50+30+50+30+50, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "or vertically will be cleared.", 0, 75+30+50+30+50+30+50+30, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(31, VisualsCore.ScreenWidth/2, 390, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		if LogicCore.GameMode == LogicCore.ChildStoryMode || LogicCore.GameMode == LogicCore.TeenStoryMode || LogicCore.GameMode == LogicCore.AdultStoryMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Do You Have The Skills", 0, 437, 1, 60, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "To Clear All 9 Levels & Win?", 0, 437+75, 1, 60, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		else:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "Do You Have The Skills", 0, 437, 1, 60, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "To Get A New High Score?", 0, 437+75, 1, 60, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(32, VisualsCore.ScreenWidth/2, 583, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)
		InterfaceCore.CreateButton (6, (VisualsCore.ScreenWidth/2), VisualsCore.ScreenHeight-25)

	if InterfaceCore.ThisButtonWasPressed(0) == true:
		ScreenToDisplayNext = TitleScreen
		ScreenFadeStatus = FadingToBlack

#	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
#		ScreenToDisplayNext = TitleScreen

	pass

#----------------------------------------------------------------------------------------
func DisplayHighScoresScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		VisualsCore.DrawSprite(10, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 0.5)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "H  I  G  H    S  C  O  R  E  S:", 0, 12, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawSprite(30, VisualsCore.ScreenWidth/2, 30, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		InterfaceCore.CreateArrowSet(0, 70)

		VisualsCore.DrawSprite(31, VisualsCore.ScreenWidth/2, 583, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)

		if VisualsCore.DEBUG == false:
			InterfaceCore.CreateButton (6, (VisualsCore.ScreenWidth/2), VisualsCore.ScreenHeight-25)
		elif VisualsCore.DEBUG == true:
			InterfaceCore.CreateButton (7, (VisualsCore.ScreenWidth/2), VisualsCore.ScreenHeight-25-67)
			InterfaceCore.CreateButton (6, (VisualsCore.ScreenWidth/2), VisualsCore.ScreenHeight-25)
			InterfaceCore.ButtonSelectedByKeyboard = 1

		if LogicCore.GameMode == LogicCore.ChildStoryMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "''Child Story Mode''", 0, 70, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.TeenStoryMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "''Teen Story Mode''", 0, 70, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.AdultStoryMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "''Adult Story Mode''", 0, 70, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.ChildNeverEndMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "''Child Never Ending Mode''", 0, 70, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.TeenNeverEndMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "''Teen Never Ending Mode''", 0, 70, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		elif LogicCore.GameMode == LogicCore.AdultNeverEndMode:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "''Adult Never Ending Mode''", 0, 70, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "NAME:", 55, 120, 0, 25, 1.0, 1.0, 0, 0.7, 0.7, 0.7, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "LEVEL:", 610, 120, 0, 25, 1.0, 1.0, 0, 0.7, 0.7, 0.7, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "SCORE:", 750, 120, 0, 25, 1.0, 1.0, 0, 0.7, 0.7, 0.7, 1.0, 0.0, 0.0, 0.0)
	
		var screenY = 154
	#	var rank
		var blue
		for rank in range(0, 10):
			blue = 1.0
#			if Score = HighScoreScore [ GameMode, rank ] and Level = HighScoreLevel [ GameMode, rank ] then blue = 0
	
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(1+rank)+".", 15-4, screenY, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, blue, 1.0, 0.0, 0.0, 0.0)
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, DataCore.HighScoreName[LogicCore.GameMode][rank], 55, screenY, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, blue, 1.0, 0.0, 0.0, 0.0)

			if DataCore.HighScoreLevel[LogicCore.GameMode][rank] < 10:
				VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(DataCore.HighScoreLevel[LogicCore.GameMode][rank]), 610, screenY, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, blue, 1.0, 0.0, 0.0, 0.0)
			elif (LogicCore.GameMode == LogicCore.ChildStoryMode || LogicCore.GameMode == LogicCore.TeenStoryMode || LogicCore.GameMode == LogicCore.AdultStoryMode):
				VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "WON!", 610, screenY, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, blue, 1.0, 0.0, 0.0, 0.0)
			else:
				VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(DataCore.HighScoreLevel[LogicCore.GameMode][rank]), 610, screenY, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, blue, 1.0, 0.0, 0.0, 0.0)

			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, str(DataCore.HighScoreScore[LogicCore.GameMode][rank]), 750, screenY, 0, 25, 1.0, 1.0, 0, 1.0, 1.0, blue, 1.0, 0.0, 0.0, 0.0)

			screenY+=37

	if InterfaceCore.ThisArrowWasPressed(0) == true:
		if LogicCore.GameMode > 0:
			LogicCore.GameMode-=1
		else:  LogicCore.GameMode = 5
		
		ScreenToDisplayNext = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(0.5) == true:
		if LogicCore.GameMode < 5:
			LogicCore.GameMode+=1
		else:  LogicCore.GameMode = 0
		
		ScreenToDisplayNext = HighScoresScreen
		ScreenFadeStatus = FadingToBlack

	if InterfaceCore.ThisButtonWasPressed(0) == true:
		DataCore.ClearHighScores()
		ScreenToDisplayNext = HighScoresScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisButtonWasPressed(1) == true:
		ScreenToDisplayNext = TitleScreen
		ScreenFadeStatus = FadingToBlack

#	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
#		ScreenToDisplayNext = TitleScreen

	pass

#----------------------------------------------------------------------------------------
func DisplayAboutScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		VisualsCore.DrawSprite(10, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 0.25)

		VisualsCore.LoadAboutScreenTexts()

	for index in range(VisualsCore.AboutTextsStartIndex, VisualsCore.AboutTextsEndIndex):
		VisualsCore.Texts.TextImage[index].rect_global_position.y-=1.5 # 3

	if VisualsCore.Texts.TextImage[VisualsCore.AboutTextsEndIndex-1].rect_global_position.y != -99999: # BANDAID - FIX IT
		if VisualsCore.Texts.TextImage[VisualsCore.AboutTextsEndIndex-1].rect_global_position.y < -45 || (InputCore.DelayAllUserInput == -1 && (InputCore.MouseButtonLeftPressed == true || InputCore.KeyboardSpacebarPressed == true || InputCore.KeyboardEnterPressed == true)):
			ScreenToDisplayNext = TitleScreen
			ScreenFadeStatus = FadingToBlack
			
			if (InputCore.MouseButtonLeftPressed == true || InputCore.KeyboardSpacebarPressed == true || InputCore.KeyboardEnterPressed == true):  AudioCore.PlayEffect(1)
			InputCore.DelayAllUserInput = 30

#	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
#		ScreenToDisplayNext = TitleScreen

	pass

#----------------------------------------------------------------------------------------
func DisplayMusicTestScreen():
	if ScreenFadeStatus == FadingFromBlack && ScreenFadeTransparency == 1.0:
		VisualServer.set_default_clear_color(Color(0.0, 0.0, 0.0, 1.0))
		VisualsCore.DrawSprite(10, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 0.5)
		VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "B . G . M .   M  U  S  I  C   T  E  S  T:", 0, 12, 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0)
		VisualsCore.DrawSprite(30, VisualsCore.ScreenWidth/2, 30, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)
 
		InterfaceCore.CreateArrowSet(0, (VisualsCore.ScreenHeight/2))
		if AudioCore.MusicCurrentlyPlaying == 0:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Title", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 1:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Title 2", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 2:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Story Intro", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 3:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Story InGame Start", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 4:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Story InGame Middle", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 5:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Story InGame End", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 6:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: InGame Never Ending", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 7:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: New High Score", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 8:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: New Top High Score", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 9:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Ending", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)
		elif AudioCore.MusicCurrentlyPlaying == 10:
			VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "BGM: Ending(Turbo!)", 0, (VisualsCore.ScreenHeight/2), 1, 25, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

		VisualsCore.DrawSprite(31, VisualsCore.ScreenWidth/2, 583, 2.85, 2.0, 0, 1.0, 1.0, 0.0, 1.0)
		InterfaceCore.CreateButton (6, (VisualsCore.ScreenWidth/2), VisualsCore.ScreenHeight-25)

	if InterfaceCore.ThisArrowWasPressed(0.0):
		if AudioCore.MusicCurrentlyPlaying > 0:
			AudioCore.PlayMusic(AudioCore.MusicCurrentlyPlaying-1)
		else:
			if LogicCore.SecretCodeCombined == 5431:
				AudioCore.PlayMusic(AudioCore.MusicTotal-1)
			else:  AudioCore.PlayMusic(AudioCore.MusicTotal-3)

		ScreenToDisplayNext = MusicTestScreen
		ScreenFadeStatus = FadingToBlack
	elif InterfaceCore.ThisArrowWasPressed(0.5):
		if LogicCore.SecretCodeCombined == 5431:
			if AudioCore.MusicCurrentlyPlaying < (AudioCore.MusicTotal-1):
				AudioCore.PlayMusic(AudioCore.MusicCurrentlyPlaying+1)
			else:  AudioCore.PlayMusic(0)
		else:
			if AudioCore.MusicCurrentlyPlaying < (AudioCore.MusicTotal-3):
				AudioCore.PlayMusic(AudioCore.MusicCurrentlyPlaying+1)
			else:  AudioCore.PlayMusic(0)

		ScreenToDisplayNext = MusicTestScreen
		ScreenFadeStatus = FadingToBlack
	if InterfaceCore.ThisButtonWasPressed(0) == true:
		ScreenToDisplayNext = TitleScreen
		ScreenFadeStatus = FadingToBlack

	if ScreenFadeStatus == FadingToBlack && ScreenFadeTransparency == 0.5:
		if ScreenToDisplayNext == TitleScreen:  AudioCore.PlayMusic(0)

	pass

#----------------------------------------------------------------------------------------
func ProcessScreenToDisplay():

	if ScreenToDisplay == GodotScreen:
		DisplayGodotScreen()
	elif ScreenToDisplay == FASScreen:
		DisplayFASScreen()
	elif ScreenToDisplay == TitleScreen:
		DisplayTitleScreen()
	elif ScreenToDisplay == OptionsScreen:
		DisplayOptionsScreen()
	elif ScreenToDisplay == HowToPlayScreen:
		DisplayHowToPlayScreen()
	elif ScreenToDisplay == HighScoresScreen:
		DisplayHighScoresScreen()
	elif ScreenToDisplay == AboutScreen:
		DisplayAboutScreen()
	elif ScreenToDisplay == MusicTestScreen:
		DisplayMusicTestScreen()

	InterfaceCore.DrawAllButtons()
	InterfaceCore.DrawAllArrowSets()
	InterfaceCore.DrawAllIcons()

	ApplyScreenFadeTransition()

	if (VisualsCore.DEBUG == false):
		VisualsCore.FramesPerSecondText.rect_global_position.x = -9999
	elif (VisualsCore.DEBUG == true):
		VisualsCore.FramesPerSecondText.rect_global_position.x = (13)

	VisualsCore.FramesPerSecondText.text = ("FPS="+str(Engine.get_frames_per_second()))


	pass
