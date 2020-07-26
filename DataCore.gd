# "DataCore.gd"
extends Node


var HighScoreName = []
var HighScoreLevel = []
var HighScoreScore = []


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


func LoadOptionsAndHighScores():


	pass


func SaveOptionsAndHighScores():


	pass


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


func _process(delta):
	
	
	pass
	

