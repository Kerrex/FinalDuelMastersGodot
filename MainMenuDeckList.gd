extends ItemList

var deckManager = preload('deck_manager.gd').new()

func _ready():
	var deck = self.deckManager.get_deck()
	var available_cards = self.deckManager.get_available_cards()
	for card in deck:
		for av_card in available_cards:
			if card == available_cards[av_card]:
				add_item(av_card)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
