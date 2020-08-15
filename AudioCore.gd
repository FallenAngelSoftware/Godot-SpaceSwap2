# "AudioCore.gd"
extends Node

var MusicVolume
var EffectsVolume

var MusicPlayer = []
var MusicTotal = 11
var MusicCurrentlyPlaying = -1

var EffectPlayer = []
var EffectsTotal = 12

#----------------------------------------------------------------------------------------
func _ready():
	MusicVolume = 1.0
	EffectsVolume = 1.0

	for index in range(0, MusicTotal):
		MusicPlayer.append(AudioStreamPlayer.new())
		if index == 0:  MusicPlayer[index].stream = load("res://media/music/TitleBGM.ogg")
		elif index == 1:  MusicPlayer[index].stream = load("res://media/music/Title2BGM.ogg")
		elif index == 2:  MusicPlayer[index].stream = load("res://media/music/StoryIntroBGM.ogg")
		elif index == 3:  MusicPlayer[index].stream = load("res://media/music/InGameStartBGM.ogg")
		elif index == 4:  MusicPlayer[index].stream = load("res://media/music/InGameMiddleBGM.ogg")
		elif index == 5:  MusicPlayer[index].stream = load("res://media/music/InGameEndBGM.ogg")
		elif index == 6:  MusicPlayer[index].stream = load("res://media/music/TimeAttackBGM.ogg")
		elif index == 7:  MusicPlayer[index].stream = load("res://media/music/NewHighScoreBGM.ogg")
		elif index == 8:  MusicPlayer[index].stream = load("res://media/music/TopHighScoreBGM.ogg")
		elif index == 9:  MusicPlayer[index].stream = load("res://media/music/Ending2BGM.ogg")
		elif index == 10:  MusicPlayer[index].stream = load("res://media/music/WinTurbo3BGM.ogg")
		add_child(MusicPlayer[index])
		MusicPlayer[index].set_volume_db(linear2db(MusicVolume))
		MusicPlayer[index].stream.set_loop(true)

	for index in range(0, EffectsTotal):
		EffectPlayer.append(AudioStreamPlayer.new())
		if index == 0:  EffectPlayer[index].stream = load("res://media/sound/MenuMove.ogg")
		elif index == 1:  EffectPlayer[index].stream = load("res://media/sound/MenuClick.ogg")
		elif index == 2:  EffectPlayer[index].stream = load("res://media/sound/Burp.ogg")
		elif index == 3:  EffectPlayer[index].stream = load("res://media/sound/Thrust.ogg")
		elif index == 4:  EffectPlayer[index].stream = load("res://media/sound/MoveSelector.ogg")
		elif index == 5:  EffectPlayer[index].stream = load("res://media/sound/SwapPieces.ogg")
		elif index == 6:  EffectPlayer[index].stream = load("res://media/sound/PiecesCleared.ogg")
		elif index == 7:  EffectPlayer[index].stream = load("res://media/sound/MultiDropClear.ogg")
		elif index == 8:  EffectPlayer[index].stream = load("res://media/sound/PlayfieldRise.ogg")
		elif index == 9:  EffectPlayer[index].stream = load("res://media/sound/LevelUp.ogg")
		elif index == 10:  EffectPlayer[index].stream = load("res://media/sound/GameOver.ogg")
		elif index == 11:  EffectPlayer[index].stream = load("res://media/sound/Explosion.ogg")
		add_child(EffectPlayer[index])
		EffectPlayer[index].set_volume_db(linear2db(EffectsVolume))
		EffectPlayer[index].stream.set_loop(false)
	pass

#----------------------------------------------------------------------------------------
func SetMusicAndEffectsVolume(var musicVolume, var effectsVolume):
	for index in range(0, MusicTotal):
		MusicPlayer[index].set_volume_db(linear2db(musicVolume))

	for index in range(0, EffectsTotal):
		EffectPlayer[index].set_volume_db(linear2db(effectsVolume))
	pass

#----------------------------------------------------------------------------------------
func PlayMusic(var index):
	if index < 0 || index > (MusicTotal-1):  return

	if MusicCurrentlyPlaying > -1:  MusicPlayer[MusicCurrentlyPlaying].stop()
	
	MusicCurrentlyPlaying = index
	MusicPlayer[MusicCurrentlyPlaying].set_volume_db(linear2db(MusicVolume))
	MusicPlayer[MusicCurrentlyPlaying].stream.set_loop(true)
	MusicPlayer[MusicCurrentlyPlaying].play(0.0)

	pass

#----------------------------------------------------------------------------------------
func PlayEffect(var index):
	if index < 0 || index > (EffectsTotal-1):  return

	EffectPlayer[index].set_volume_db(linear2db(EffectsVolume))
	EffectPlayer[index].stream.set_loop(false)
	EffectPlayer[index].play(0.0)

	pass

#----------------------------------------------------------------------------------------
func _process(delta):

	pass
