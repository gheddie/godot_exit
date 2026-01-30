@abstract
class_name BaseCollectable
extends StaticBody3D

const COLLECTABLE_OFFSET = 5.0
const MAX_COLLECTABLE_IMPACT = 10

var collectedImpact: int  = 0

func acceptPlayerPosition(_position: Vector3) -> void:
	var distance = global_position.distance_to(_position)
	# print(str("distance to player --> ", str(distance)))
	if distance <= COLLECTABLE_OFFSET:
		harvestMe()
		if collectedImpact >= MAX_COLLECTABLE_IMPACT:	
			harvestingFinished()
			
func harvestMe() -> void:
	collectedImpact += 1
	print(str("harvested up to --> ", str(collectedImpact)))

func harvestingFinished() -> void:
	queue_free()	

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	pass
