require_relative './credit_card'

number = 5423661657234057

card = CreditCard.new(number, nil, nil, nil)
puts card.validate_checksum

serialize_card = card.to_json()

puts "serialize_card = #{serialize_card} \n"

card2= CreditCard.from_s(serialize_card)

#puts "deserialize_card to obj= #{card2} \n"

puts card2.number
