extends ConfirmationDialog

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var server_url = "http://localhost:9999/register"
onready var deckManager = preload('deck_manager.gd').new()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_CreateButton_pressed():
	popup()
	connect("confirmed", self, "_confirmed")
	 # replace with function body
	
func _confirmed():
	print('confirming')
	var data = {}
	data['cardNames'] = self.deckManager.get_deck()
	data['gameName'] = $LineEdit.text
	
	var json_data = JSON.print(data)
	print(json_data)
	$HTTPRequest.request(server_url, PoolStringArray(), true, HTTPClient.METHOD_POST, json_data)
	
