class_name Level1
extends BaseLevel

func get_start_point() -> String:
	return "FloorPlate15"

func get_end_point() -> String:
	return "FloorPlate28"

func get_collectable_positions() -> Array:
	return [
		"red@FloorPlate12",
		"blue@FloorPlate22",
		"green@FloorPlate27",
		"blue@FloorPlate101",
		"red@FloorPlate172",
		"green@FloorPlate173",		
		"blue@FloorPlate207",
		"green@FloorPlate240"		
		]
