extends RigidBody2D


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_sleeping(true)
	pass
	
	
func _on_Area2D_body_entered(body):
	print("rigidBody.on_body_entered: ", body, body.name)
	if body.name == "Player":
		set_sleeping(false)
