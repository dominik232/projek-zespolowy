extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(String, FILE, "*.tscn") var next_level

func _physics_process(delta):
	var bodies = get_overlapping_bodies()

	for  body in bodies:
		if body.name == "Player":
			get_tree().change_scene(next_level)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
