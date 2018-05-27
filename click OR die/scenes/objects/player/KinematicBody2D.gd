extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const UP = Vector2(0, -1)
const GRAVITY = 15
const ACCELERATION = 40
const MAX_SPEED = 250
const JUMP_HEIGHT = 500

var motion = Vector2()
var alive = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	alive = true
	pass
	
	
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if $LeftClickGravity.get_space_override_mode() == $LeftClickGravity.SPACE_OVERRIDE_DISABLED:
			$LeftClickGravity.set_space_override_mode($LeftClickGravity.SPACE_OVERRIDE_COMBINE)
		
		var motion = (get_viewport().get_mouse_position() - $LeftClickGravity.position - (get_viewport().get_size() / 2)) * 0.2
		#print(motion, " = ", get_viewport().get_mouse_position(), " - ", $LeftClickGravity.position)
		$LeftClickGravity.translate(get_viewport().get_mouse_position() - $LeftClickGravity.position - (get_viewport().get_size() / 2))
	else:
		$LeftClickGravity.set_space_override_mode($LeftClickGravity.SPACE_OVERRIDE_DISABLED)


func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		$Sprite.play("idle")
		friction = true
		
	if is_on_floor():
		# print("On floor")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		
	motion = move_and_slide(motion, UP)
	
	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func is_alive():
	return alive

func _on_Player_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Player._on_Player_input_event() - mouse pressed")

func _on_HeadColisionArea_body_shape_entered(body_id, body, body_shape, area_shape):
	#print("PLyaer head  body_shape ", body, body_shape)
	if is_on_floor():
		print("KILLED")
		alive = false
