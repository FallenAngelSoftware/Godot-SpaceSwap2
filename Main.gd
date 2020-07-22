#----------------------------------------------------------------------------------------
#        "Grand National GNX" Open-Source / Cross-Platform 2-D Godot Game Engine
#   _________                             _________                        ________TM
#  /   _____/__________    ____  ____    /   _____/_  _  _______  ______   \_____  \ 
#  \_____  \\____ \__  \ _/ ___\/ __ \   \_____  \\ \/ \/ /\__  \ \____ \   /  ____/ 
#  /        \  |_> > __ \\  \__\  ___/   /        \\     /  / __ \|  |_> > /       \ 
# /_______  /   __(____  /\___  >___  > /_______  / \/\_/  (____  /   __/  \_______ \
#         \/|__|       \/     \/    \/          \/              \/|__|             \/
#
#                    (C)2020 By Team "www.FallenAngelSoftware.com"
#----------------------------------------------------------------------------------------
extends Node

#----------------------------------------------------------------------------------------
func _ready():
	VisualsCore.DrawSprite(0, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 1.0)
	VisualsCore.Sprites.SpriteImage[0].set_z_index(1000)


# Below is just a temporary test of the new VisualsCore:

	Engine.target_fps = 30



#	VisualsCore.TestTextScaleX = 1.0
#	VisualsCore.TestTextScaleY = 1.0
#	VisualsCore.TestTextRotation = 0
#	VisualsCore.DrawText(VisualsCore.TextCurrentIndex, "DEMO", 0, VisualsCore.ScreenHeight/2, 1, 60, 1.0, 1.0, 0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)

	
	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	ScreensCore.ProcessScreenToDisplay()

# Below is just a temporary test of the new VisualsCore:

#	if VisualsCore.TestTextScaleX < 5.0:
#		VisualsCore.TestTextScaleX+=0.1
#	else: VisualsCore.TestTextScaleX = 0.0
#
#	if VisualsCore.TestTextScaleY < 5.0:
#		VisualsCore.TestTextScaleY+=0.1
#	else: VisualsCore.TestTextScaleY = 0.0
#
#	if VisualsCore.TestTextRotation < 360:
#		VisualsCore.TestTextRotation+=1
#	else: VisualsCore.TestTextRotation = 0
#
#	VisualsCore.DrawnTextChangeScaleRotation(2, VisualsCore.TestTextScaleX, VisualsCore.TestTextScaleY, VisualsCore.TestTextRotation)

	pass
