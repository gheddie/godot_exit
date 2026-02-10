extends CharacterBody3D

const SPEED = 2.5
const JUMP_VELOCITY = 4.5
const TURN_SPEED = 2.5

@onready var animationTree: AnimationTree = $AnimationTree

func _ready() -> void:
	# animationPlayer.play("walk")
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		walk()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		idle()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	handle_rotation(delta)
	move_and_slide()

func handle_rotation(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):		
		rotation.y += TURN_SPEED * delta
	if Input.is_action_pressed("ui_right"):
		rotation.y -= TURN_SPEED * delta	

func walk() -> void:
	animationTree["parameters/conditions/idle"] = false
	animationTree["parameters/conditions/walk"] = true	
	
func idle() -> void:
	animationTree["parameters/conditions/idle"] = true
	animationTree["parameters/conditions/walk"] = false	
