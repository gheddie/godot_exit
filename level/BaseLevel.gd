@abstract
class_name BaseLevel
extends Node3D

var floor_plates : Dictionary[String, FloorPlate] = {}

var player_instance: PackedScene = preload("res://assets/player/Player.tscn")

func _ready() -> void:	
	var plates = find_all_items(get_tree().root, [])
	for plate in plates:
		print(str("detected fllor plate --> ", str(plate.name)))
		floor_plates.set(plate.name, plate)
	print(str("starting level ", str(self), ", ", "[", str(floor_plates.size()), "] ", " floor plates..."), str("(", get_start_point(), "->", get_end_point(), ")"))
	put_player()
	put_collectables()
	
func put_collectables() -> void:	
	var collectables = get_collectable_positions()
	print(str("putting ", str(collectables.size()), " collectables..."))
	var collectable_instance: BaseCollectable
	for collectable in collectables:		
		collectable_instance = CollectableFactoryInstance.make_collectable_instance(collectable.split("@")[0])
		collectable_instance.global_position = get_plate_position(collectable.split("@")[1])
		get_tree().get_current_scene().add_child(collectable_instance)
	
func put_player() -> void:	
	var player = player_instance.instantiate()
	player.global_position = get_plate_by_name(get_start_point()).global_position
	get_tree().get_current_scene().add_child(player)
	
func get_plate_by_name(name: String) -> FloorPlate:
	var plate = floor_plates.get(name)
	return plate
	
func get_plate_position(name: String) -> Vector3:
	return get_plate_by_name(name).global_position

func find_all_items(node, list) :
	var children = node.get_children()
	for child in children:
		if child is FloorPlate:
			list.append(child)
	for child in children:
		find_all_items(child, list)
	return list

@abstract
func get_start_point() -> String	

@abstract
func get_end_point() -> String	

@abstract
func get_collectable_positions() -> Array
