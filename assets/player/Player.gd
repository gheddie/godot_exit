class_name Player
extends CharacterBody3D

const WALK_SPEED = 5.0
const TURN_SPEED = 2.5
const JUMP_HEIGHT = 2.5
const GRAVITY = 9.81
const CAMERA_TWEEN_SPEED = 0.75

@onready var forwardRaycast: RayCast3D = $ForwardRayCast
@onready var leftRaycast: RayCast3D = $LeftRayCast
@onready var rightRaycast: RayCast3D = $RightRayCast
@onready var camera: Camera3D = $Camera3D

var origCamPos: Vector3 = Vector3(-4.0,7.0,-6.0)
var harvestingCamPos: Vector3 = Vector3(-2.0,3.0,-3.0)

func _process(_delta: float) -> void:
	# GameManagerInstance.acceptPlayerPosition(global_position)	
	pass

func _ready() -> void:
	camera.position = origCamPos

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	# handleJump(delta)
	var input_dir := Input.get_vector("NIL", "NIL", "move_backward", "move_forward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * WALK_SPEED
		velocity.z = direction.z * WALK_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)
		velocity.z = move_toward(velocity.z, 0, WALK_SPEED)
	handle_rotation(delta)
	move_and_slide()
	
func handleJump(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = sqrt(JUMP_HEIGHT * 2.0 * GRAVITY)

func handle_rotation(delta: float) -> void:
	if Input.is_action_pressed("turn_left"):		
		rotation.y += TURN_SPEED * delta
	if Input.is_action_pressed("turn_right"):
		rotation.y -= TURN_SPEED * delta	

func getTargettedObjects() -> Array[Object]:
	var targetted: Array[Object] = []
	if forwardRaycast.is_colliding():
		targetted.append(forwardRaycast.get_collider())
	if leftRaycast.is_colliding():
		targetted.append(leftRaycast.get_collider())
	if rightRaycast.is_colliding():
		targetted.append(rightRaycast.get_collider())
	return targetted

func tweenCameraPosition() -> void:	
	var justCollecting: bool = GameManagerInstance.actualLevel.isCollectingInProcess()
	var cameraTargetPosition: Vector3
	if justCollecting:
		print("collecting in process...")
		cameraTargetPosition = harvestingCamPos
	else:
		pass
		cameraTargetPosition = origCamPos
	if camera.global_position != cameraTargetPosition:
		var cameraPositionTween = get_tree().create_tween()
		cameraPositionTween.tween_property(camera, "position", cameraTargetPosition, CAMERA_TWEEN_SPEED)
