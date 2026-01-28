@abstract
class_name BaseCollectable
extends StaticBody3D

const COLLECTABLE_OFFSET = 5.0

func acceptPlayerPosition(_position: Vector3) -> void:
	var distance = global_position.distance_to(_position)	
	# print(distance)
	if distance <= COLLECTABLE_OFFSET:		
		queue_free()		
