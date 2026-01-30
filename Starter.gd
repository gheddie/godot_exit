extends Node3D

func _ready() -> void:			
	
	LevelProviderInstance.registerLevel(preload("res://level/CollectingTestLevel.tscn"))
	LevelProviderInstance.registerLevel(preload("res://level/LevelA.tscn"))
	LevelProviderInstance.registerLevel(preload("res://level/DuplicationLevel.tscn"))	
	
	LevelProviderInstance.startLevelSequence(get_tree())	
