# "LogicCore.gd"
extends Node

var Version = "Version 2 - Unplayable Alpha - Game Engine Testing"

const ChildStoryMode				= 0
const TeenStoryMode					= 1
const AdultStoryMode				= 2
const ChildNeverEndMode				= 3
const TeenNeverEndMode				= 4
const AdultNeverEndMode				= 5
var GameMode = AdultStoryMode

var GameSpeed = 30

var StartingLevelForGameMode = []
var StartingLevel

var SecretCode = []
var SecretCodeCombined = 0

#----------------------------------------------------------------------------------------
func _ready():
	StartingLevelForGameMode.append(0)
	StartingLevelForGameMode.append(0)
	StartingLevelForGameMode.append(0)
	StartingLevelForGameMode.append(0)
	StartingLevelForGameMode.append(0)
	StartingLevelForGameMode.append(0)

	StartingLevel = StartingLevelForGameMode[GameMode]

	SecretCode.append(0)
	SecretCode.append(0)
	SecretCode.append(0)
	SecretCode.append(0)

	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	pass
