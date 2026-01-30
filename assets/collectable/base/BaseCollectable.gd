@abstract
class_name BaseCollectable
extends StaticBody3D

const HARVESTING_OFFSET = 3.5
const WOBBLE_INTERVAL = 0.05

var collectedImpact: int  = 0

func harvestMe(playerPosition: Vector3) -> void:
	var distance = global_position.distance_to(playerPosition)
	# print(str("distance to player --> ", str(distance)))
	if distance <= HARVESTING_OFFSET:
		wobble()
		collectedImpact += 1
		print(str("harvested up to --> ", str(collectedImpact)))
		if collectedImpact >= getMaxCollectableImpact():	
			harvestingFinished()

func wobble() -> void:		
	var origScale = scale
	var tweenedScale = scale * 0.75	
	var tween = create_tween()	
	tween.tween_property(self, "scale", tweenedScale, WOBBLE_INTERVAL)
	tween.tween_property(self, "scale", origScale, WOBBLE_INTERVAL)	

func harvestingFinished() -> void:
	queue_free()	

func evaluatePlayerPosition(playerPosition: Vector3) -> void:
	harvestMe(playerPosition)
	
@abstract
func getMaxCollectableImpact() -> int
