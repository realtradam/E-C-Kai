extends KinematicBody2D


signal died(position_record)


export var GRAVITY = 1500.0
export var WALK_SPEED = 400
export var JUMP_FORCE = 400.0
export var HELD_JUMP_BOOST = 0.3

var velocity = Vector2()
var respawn_position
var position_record = []

# Called when the node enters the scene tree for the first time.
func _ready():
	respawn_position = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	position_record.append(position)
	
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("jump") and self.is_on_floor():
		velocity.y = -JUMP_FORCE
	
	if Input.is_action_pressed("jump") and not self.is_on_floor():
		velocity.y += delta * -GRAVITY * HELD_JUMP_BOOST
	
	if not self.is_on_floor():
		velocity.y += delta * GRAVITY
	
	if self.is_on_ceiling():
		velocity.y = 1
	
	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, -1))

func respawn():
	position = respawn_position
	position_record = []
	velocity.y = 0

func die():
	position_record.append(position)
	emit_signal("died", position_record)
	respawn()
	print('dead')
