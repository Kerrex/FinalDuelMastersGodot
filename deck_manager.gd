extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func get_available_cards():
	var cardFile = File.new()
	var cards = {}
	
	if !cardFile.file_exists('available-cards.csv'):
		print('file with available cards does not exists!')
		
	cardFile.open('available-cards.csv', cardFile.READ)
	while !cardFile.eof_reached():
		var card = cardFile.get_csv_line(";")
		cards[card[1]] = card[0]
	cardFile.close()
	return cards


func get_deck():
	var available_cards = get_available_cards()
	var deckFile = File.new()
	if !deckFile.file_exists('deck.txt'):
		return []
	
	var card_list = []
	deckFile.open('deck.txt', deckFile.READ)
	while !deckFile.eof_reached():
		var card_identifier = deckFile.get_line()
		if card_identifier != '':
			card_list.append(card_identifier)
	deckFile.close()
	return card_list
	
func save_deck(deck):
	var deck_file = File.new()
	deck_file.open('deck.txt', deck_file.WRITE)
	
	for item in deck:
		deck_file.store_line(item)
	deck_file.close()
