extends Node
#The currently active scene
#var currentScene = null

#func _physics_process(delta):
var mainScene="res://scenes/main/main.tscn";
var level1="res://scenes/level1/level1.tscn";
var level2="res://scenes/level2/level2.tscn";

	
func _input(event):
	if(event.is_action_pressed("load_main_screen")):
		print("load main");
		setScene(mainScene)
	else: if(event.is_action_pressed("1")):
		print("load 1");
		setScene(level1)
	else: if(event.is_action_pressed("2")):
		print("load 2");
		setScene(level2)

        

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
   
