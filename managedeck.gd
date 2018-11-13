extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var selected_cards = []
var deckManager = preload('deck_manager.gd').new()

func _ready():
	var deck = self.deckManager.get_deck()
	var available_cards = self.deckManager.get_available_cards()
	for card_id in deck:
		for card_name in available_cards:
			if card_id == available_cards[card_name]:
				self.selected_cards.append(card_name) 
	self.refresh_deck()

func get_count(array, item):
	var counter = 0
	for x in array:
		if x == item:
			counter = counter+1
	return counter

func refresh_deck():
	$DeckList.clear()
	for card in self.selected_cards:
		$DeckList.add_item(card)
		

func _on_Add_pressed():
	var cards = self.deckManager.get_available_cards()
	var selectedItemsIdx = $AvailableCardList.get_selected_items()
	if selectedItemsIdx.size() == 0:
		return
	var selectedItem = $AvailableCardList.get_item_text(selectedItemsIdx[0])
	print('Selected: ' + selectedItem)
	
	var count = get_count(self.selected_cards, selectedItem)
	if count < 4:
		self.selected_cards.append(selectedItem)
		refresh_deck()


func _on_Remove_pressed():
	var selected_cards_idx = $DeckList.get_selected_items()
	for idx in selected_cards_idx:
		self.selected_cards.remove(idx)
		refresh_deck()


func _on_Save_pressed():
	
	var available_cards = self.deckManager.get_available_cards()
	
	var cards_to_save = []
	for card in self.selected_cards:
		cards_to_save.append(available_cards[card])
	self.deckManager.save_deck(cards_to_save)
	get_tree().change_scene('mainmenu.tscn')
