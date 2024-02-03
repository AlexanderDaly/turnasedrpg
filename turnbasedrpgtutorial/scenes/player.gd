extends CharacterBody2D

@onready var PlayerAnim = get_node("AnimSprite2D")

var direction = 'r'
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	PlayerMovement()
	PlayerAnimation()

func PlayerMovement():
	velocity = Input.get_vector("left", "right", "up", "down")
	
	velocity = velocity.normalized() * SPEED

	move_and_slide()


func PlayerAnimation():
	if (velocity.x > 0):
		direction = "r"
	elif (velocity.x < 0):
		direction = "l"
	elif (velocity.y > 0):
		direction = "d"
	elif (velocity.y < 0):
		direction = "u"
		
	if (velocity == Vector2.ZERO):
		PlayerAnim.play("idle_" + direction)
	else:
		PlayerAnim.play("walk_" + direction)
