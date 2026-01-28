class_name Player
extends CharacterBody3D

# const WALK_SPEED = 5.0
# const TURN_SPEED = 2.5

const WALK_SPEED = 10.0
const TURN_SPEED = 5.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
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

func handle_rotation(delta: float) -> void:
	if Input.is_action_pressed("turn_left"):		
		rotation.y += TURN_SPEED * delta
	if Input.is_action_pressed("turn_right"):
		rotation.y -= TURN_SPEED * delta	
