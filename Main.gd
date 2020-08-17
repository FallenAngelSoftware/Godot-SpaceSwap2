#----------------------------------------------------------------------------------------
#                    __   __
#                    \ \ / /
#  " Grand National GN> X < " Open-Source / Cross-Platform 2-D Godot 3.x Game Engine
#                    /_/ \_\
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
#	Engine.target_fps = 30

#	if ScreensCore.OperatingSys == ScreensCore.OSAndroid:
#		OS.set_window_size( Vector2(360.0, 640.0) )
#		get_viewport().set_size( Vector2 (360.0, 640.0) )


	DataCore.LoadOptionsAndHighScores()


	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	ScreensCore.ProcessScreenToDisplay()

	pass
#                                            [TM]
# "A 110% By Team "www.FallenAngelSoftware.com"!
