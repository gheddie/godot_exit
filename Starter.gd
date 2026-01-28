extends Node3D

func _ready() -> void:
	
	LevelProviderInstance.registerLevel(preload("res://level/Level1.tscn"))
	LevelProviderInstance.registerLevel(preload("res://level/Level2.tscn"))
	LevelProviderInstance.registerLevel(preload("res://level/Level3.tscn"))
	
	LevelProviderInstance.startLevelSequence(get_tree())	
