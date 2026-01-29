@abstract
class_name BaseCollectable
extends StaticBody3D

const COLLECTABLE_OFFSET = 5.0
const MAX_COLLECTABLE_IMPACT = 10

var collectedImpact: int  = 0

func acceptPlayerPosition(_position: Vector3) -> void:
	var distance = global_position.distance_to(_position)
	if distance <= COLLECTABLE_OFFSET:
		collectedImpact += 1
		if collectedImpact >= MAX_COLLECTABLE_IMPACT:	
			harvestingFinished()

func harvestingFinished() -> void:
	# queue_free()
	pass

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	queue_free()
