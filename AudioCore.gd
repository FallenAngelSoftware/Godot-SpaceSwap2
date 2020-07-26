# "AudioCore.gd"
extends Node


var MusicVolume
var EffectsVolume

var MusicPlayer = []
var MusicCurrentlyPlaying = -1

var EffectPlayer = []


func _ready():
	MusicVolume = 1.0
	EffectsVolume = 1.0

	MusicPlayer.append(AudioStreamPlayer.new())
	MusicPlayer[0].stream = load("res://media/music/TitleBGM.ogg")
	add_child(MusicPlayer[0])
	MusicPlayer[0].set_volume_db(linear2db(MusicVolume))
	MusicPlayer[0].stream.set_loop(true)

	EffectPlayer.append(AudioStreamPlayer.new())
	EffectPlayer[0].stream = load("res://media/sound/MenuMove.ogg")
	add_child(EffectPlayer[0])
	EffectPlayer[0].set_volume_db(linear2db(EffectsVolume))
	EffectPlayer[0].stream.set_loop(false)

	EffectPlayer.append(AudioStreamPlayer.new())
	EffectPlayer[1].stream = load("res://media/sound/MenuClick.ogg")
	add_child(EffectPlayer[1])
	EffectPlayer[1].set_volume_db(linear2db(EffectsVolume))
	EffectPlayer[1].stream.set_loop(false)

	pass


func PlayMusic(var index):
	if MusicCurrentlyPlaying > -1:  MusicPlayer[MusicCurrentlyPlaying].stop()
	MusicCurrentlyPlaying = index
	MusicPlayer[MusicCurrentlyPlaying].set_volume_db(linear2db(MusicVolume))
	MusicPlayer[MusicCurrentlyPlaying].stream.set_loop(true)
	MusicPlayer[MusicCurrentlyPlaying].play(0.0)

	pass


func PlayEffect(var index):
	EffectPlayer[index].set_volume_db(linear2db(EffectsVolume))
	EffectPlayer[index].stream.set_loop(false)
	EffectPlayer[index].play(0.0)



func _process(delta):


	pass

