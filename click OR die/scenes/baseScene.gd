extends Node
#The currently active scene
#var currentScene = null

#func _physics_process(delta):
	
	
func _input(event):
	if(event.is_action_pressed("0")):
		print("load main");
		setScene("res://scenes/main/main.tscn")
	else: if(event.is_action_pressed("1")):
		print("load 1");
		setScene("res://scenes/level1/level1.tscn")
	else: if(event.is_action_pressed("2")):
		print("load 2");
		setScene("res://scenes/level2/level2.tscn")

        

#func _ready():
   #On load set the current scene to the last scene available
#	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
   #Demonstrate setting a global variable.
   #Globals.set("MAX_POWER_LEVEL",9000)
#	print(currentScene)
   
# create a function to switch between scenes 
func setScene(scene):
	get_tree().change_scene(scene)
   #clean up the current scene
#	currentScene.queue_free()
   #load the file passed in as the param "scene"
#	var s = ResourceLoader.load(scene)
   #create an instance of our scene
#	currentScene = s.instance()
   # add scene to root
#	get_tree().get_root().add_child(currentScene)
   
