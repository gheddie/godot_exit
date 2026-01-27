class_name Level2
extends BaseLevel

func get_start_point() -> String:
	return "FloorPlate4"

func get_end_point() -> String:
	return "FloorPlate52"

func get_collectable_positions() -> Array:
	return ["red@FloorPlate1", "green@FloorPlate2"]
