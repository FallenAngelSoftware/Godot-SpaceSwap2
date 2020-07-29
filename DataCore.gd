# "DataCore.gd"
extends Node

var HighScoreName = []
var HighScoreLevel = []
var HighScoreScore = []

const FILE_NAME = "user://game-data.json"

#----------------------------------------------------------------------------------------
func ClearHighScores():
	for mode in range(0, 6):
		HighScoreName[mode][0] = "JeZxLee"
		HighScoreName[mode][1] = "Daotheman"
		HighScoreName[mode][2] = "theweirdn8"
		HighScoreName[mode][3] = "mattmatteh"
		HighScoreName[mode][4] = "Oshi Bobo"
		HighScoreName[mode][5] = "D.J. Fading Twilight"
		HighScoreName[mode][6] = "Godot Engine"
		HighScoreName[mode][7] = "You"
		HighScoreName[mode][8] = "Them"
		HighScoreName[mode][9] = "Us"

		HighScoreLevel[mode][0] = 10
		HighScoreLevel[mode][1] = 9
		HighScoreLevel[mode][2] = 8
		HighScoreLevel[mode][3] = 7
		HighScoreLevel[mode][4] = 6
		HighScoreLevel[mode][5] = 5
		HighScoreLevel[mode][6] = 4
		HighScoreLevel[mode][7] = 3
		HighScoreLevel[mode][8] = 2
		HighScoreLevel[mode][9] = 1

		HighScoreScore[mode][0] = 10000
		HighScoreScore[mode][1] = 9000
		HighScoreScore[mode][2] = 8000
		HighScoreScore[mode][3] = 7000
		HighScoreScore[mode][4] = 6000
		HighScoreScore[mode][5] = 5000
		HighScoreScore[mode][6] = 4000
		HighScoreScore[mode][7] = 3000
		HighScoreScore[mode][8] = 2000
		HighScoreScore[mode][9] = 1000
	pass

#----------------------------------------------------------------------------------------
func LoadOptionsAndHighScores():
	var player
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			player = data
		else:
			printerr("Corrupted data!")
			return false
	else:
		printerr("No saved data!")
		return false

	AudioCore.MusicVolume = player.MusicVolumeValue
	AudioCore.EffectsVolume = player.EffectsVolumeValue
	LogicCore.GameMode = player.GameModeValue
	LogicCore.GameSpeed = player.GameSpeedValue
	LogicCore.StartingLevelForGameMode[0] = player.GameStartingLevel0Value
	LogicCore.StartingLevelForGameMode[1] = player.GameStartingLevel1Value
	LogicCore.StartingLevelForGameMode[2] = player.GameStartingLevel2Value
	LogicCore.StartingLevelForGameMode[3] = player.GameStartingLevel3Value
	LogicCore.StartingLevelForGameMode[4] = player.GameStartingLevel4Value
	LogicCore.StartingLevelForGameMode[5] = player.GameStartingLevel5Value
	HighScoreName = player.HighscoreNameValue
	HighScoreLevel = player.HighScoreLevelValue
	HighScoreScore = player.HighScoreScoreValue

	pass

#----------------------------------------------------------------------------------------
func SaveOptionsAndHighScores():
	var player = {
		"MusicVolumeValue": AudioCore.MusicVolume,
		"EffectsVolumeValue": AudioCore.EffectsVolume,
		"GameModeValue": LogicCore.GameMode,
		"GameSpeedValue": LogicCore.GameSpeed,
		"GameStartingLevel0Value": LogicCore.StartingLevelForGameMode[0],
		"GameStartingLevel1Value": LogicCore.StartingLevelForGameMode[1],
		"GameStartingLevel2Value": LogicCore.StartingLevelForGameMode[2],
		"GameStartingLevel3Value": LogicCore.StartingLevelForGameMode[3],
		"GameStartingLevel4Value": LogicCore.StartingLevelForGameMode[4],
		"GameStartingLevel5Value": LogicCore.StartingLevelForGameMode[5],
		"HighscoreNameValue": HighScoreName,
		"HighScoreLevelValue": HighScoreLevel,
		"HighScoreScoreValue": HighScoreScore
	}

	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(player))
	file.close()

	pass

#----------------------------------------------------------------------------------------
func _ready():
	for x in range(6):
		HighScoreName.append([])
		HighScoreName[x].resize(10)
		for y in range(10):
			HighScoreName[x][y] = null

	for xL in range(6):
		HighScoreLevel.append([])
		HighScoreLevel[xL].resize(10)
		for yL in range(10):
			HighScoreLevel[xL][yL] = null

	for xS in range(6):
		HighScoreScore.append([])
		HighScoreScore[xS].resize(10)
		for yS in range(10):
			HighScoreScore[xS][yS] = null

	ClearHighScores()

	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	pass
