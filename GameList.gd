extends ItemList

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var server_url = "http://localhost:9999"
var gamesList = []

func _ready(): 
	refresh_games()
	
	# Called when the node is added to the scene for the first time.
	# Initialization herse
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func refresh_games():
	clear()
	$HTTPRequest.request(server_url + "/available-games")
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json_body = body.get_string_from_utf8()
	print("Got available games: " + json_body)
	if response_code == 200:
		var games = JSON.parse(json_body).result
		print(games)
		for game in games:
			gamesList.append(game)
			add_item(game["name"], null, true);
	else:
		print("Error!")


func _on_RefreshButton_pressed():
	refresh_games()


func _on_JoinButton_pressed():
	var selected = get_selected_items()
	if selected.size() != 1:
		return
	
	var selected_idx = selected[0]
	var game_uuid = gamesList[selected_idx]["uuid"]
	print("Joining " + game_uuid)
