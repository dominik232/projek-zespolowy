extends "../baseScene.gd"

#export(PackedScene) var nextLevel;

func _ready():
	print("main scene loaded")
   #On load set the current scene to the last scene available
#	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
   #Demonstrate setting a global variable.
   #Globals.set("MAX_POWER_LEVEL",9000)
#	print(currentScene)
   
