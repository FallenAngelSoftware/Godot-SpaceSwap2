#----------------------------------------------------------------------------------------
#                      __   __
#                      \ \ / /
#    " Grand National GN> X < " Open-Source / Cross-Platform 2-D Godot 3.x Game Engine
#                      /_/ \_\
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
	Engine.target_fps = 30
	
	VisualsCore.DrawSprite(0, VisualsCore.ScreenWidth/2, VisualsCore.ScreenHeight/2, 2.845, 1.0, 0, 1.0, 1.0, 1.0, 1.0)
	VisualsCore.Sprites.SpriteImage[0].set_z_index(1000)

	DataCore.LoadOptionsAndHighScores()

	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	ScreensCore.ProcessScreenToDisplay()


	pass
