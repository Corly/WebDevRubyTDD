def classify_poker_hand(poker_hand)
#:unexpected_return_value

	if !(poker_hand.is_a? Array)
		return :not_a_ruby_array
	end

	if poker_hand.length != 5
		return :too_many_or_too_few_cards
	end

	for i in 0..(poker_hand.length - 1)
		if !(poker_hand[i].is_a? Integer)
			return :at_least_one_card_is_not_an_integer
		end
	end

	cards = poker_hand.sort
	high_card = false
	one_pair = false
	one_pair_number = -1
	two_pairs = false
	three_of_a_kind = false
	three_of_a_kind_number = -1
	four_of_a_kind = false
	straight = true
	full_house = false
	at_least_one_card_is_out_of_bounds = false
	imposible_hand = true
	number_of_consecutive_cards = 1

	for i in 0..(cards.length - 2)

		if cards[i] + 1 == cards[i+1]
			number_of_consecutive_cards += 1
		else 
			number_of_consecutive_cards = 1
		end

		if number_of_consecutive_cards >= 3
			high_card = true
		end

		if cards[i] >= 1500 || cards[cards.length-1] >= 1500
			at_least_one_card_is_out_of_bounds = true
		end

		if cards[i] != cards[i+1]
			imposible_hand = false
		end

		if cards[i] + 1 != cards[i+1]
			straight = false
		end

		if three_of_a_kind && cards[i] == cards[i+1] && 
				three_of_a_kind_number == cards[i]
			four_of_a_kind = true
		end

		if one_pair && cards[i] == cards[i+1] && cards[i] == one_pair_number
			three_of_a_kind = true
			three_of_a_kind_number = cards[i]
		end

		if one_pair && cards[i] == cards[i+1] && cards[i] != one_pair_number
			two_pairs = true
		end

		if cards[i] == cards[i+1]
			one_pair = true
			one_pair_number = cards[i]
		end
	end

	if at_least_one_card_is_out_of_bounds
		return	:at_least_one_card_is_out_of_bounds
	end

	if imposible_hand
		return :impossible_hand
	end
	
	if four_of_a_kind
		return :four_of_a_kind
	end

	if two_pairs && three_of_a_kind
		return :full_house
	end

	if straight 
		return :straight
	end

	if three_of_a_kind
		return :three_of_a_kind
	end

	if two_pairs
		return :two_pairs
	end

	if one_pair
		return :one_pair
	end

	if high_card
		return :high_card
	end

	return :valid_but_nothing_special
end

