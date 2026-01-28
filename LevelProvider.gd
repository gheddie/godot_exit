class_name LevelProvider
extends Node

var levels: Array[PackedScene] = []
var actualLevelIndex: int = 0
var tree: SceneTree

func startLevelSequence(sceneTree: SceneTree) -> void:	
	tree = sceneTree
	tree.change_scene_to_packed(levels[actualLevelIndex])
	
func levelFinished() -> void:
	actualLevelIndex += 1
	if actualLevelIndex < levels.size():
		loadLevelByIndex()
	else:
		terminateLevelSequence()
		
func terminateLevelSequence() -> void:
	if tree != null:
		tree.quit()
	
func loadLevelByIndex() -> void:
	tree.change_scene_to_packed(levels[actualLevelIndex])

func registerLevel(level: Resource) -> void:
	levels.append(level)
