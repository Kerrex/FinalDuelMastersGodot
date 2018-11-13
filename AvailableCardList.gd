extends ItemList

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var deckManager = preload('deck_manager.gd').new()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var available_cards = self.deckManager.get_available_cards()
	for card in available_cards:
		add_item(card)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
