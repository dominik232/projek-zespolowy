extends KinematicBody2D

export var gravity_revers=false;
export var gr_use_once=false;

var gr_was_used=false;

var GRAVITY_VEC = Vector2(0, 900)
var FLOOR_NORMAL = Vector2(0, -1)

var direction_reverse = 1;

const WALK_SPEED = 70
const STATE_WALKING = 0
const STATE_KILLED = 1

var linear_velocity = Vector2()
var direction = -1
var anim=""

var state = STATE_WALKING

onready var detect_floor_left = $detect_floor_left
onready var detect_wall_left = $detect_wall_left
onready var detect_floor_right = $detect_floor_right
onready var detect_wall_right = $detect_wall_right
onready var sprite = $sprite

func _physics_process(delta):
	var new_anim = "idle"

	if state==STATE_WALKING:
		linear_velocity += GRAVITY_VEC * delta
		linear_velocity.x = direction * WALK_SPEED
		linear_velocity = move_and_slide(linear_velocity, FLOOR_NORMAL)

		if not detect_floor_left.is_colliding() or detect_wall_left.is_colliding():
			direction = 1.0

		if not detect_floor_right.is_colliding() or detect_wall_right.is_colliding():
			direction = -1.0

		sprite.scale = Vector2(direction*direction_reverse, 1.0)
		new_anim = "walk"
	else:
		new_anim = "explode"


	if anim != new_anim:
		anim = new_anim
		$anim.play(anim)


func hit_by_bullet():
	state = STATE_KILLED



func _on_Area2D_body_entered(body):

	if(!gravity_revers):
		return
		
	if(gr_use_once && gr_was_used):
		return
		
	if(body.get_name() == "Player"):
			if(GRAVITY_VEC.y < 0):
				rotate(deg2rad(180))
			else:
				rotate(deg2rad(-180))
	
			GRAVITY_VEC = Vector2(0, -1 * GRAVITY_VEC.y)
		
			gr_was_used=true
			
			direction_reverse=-1
		
#			print(get_node("/root/colworld/enemys/enemy"))
	
	


		