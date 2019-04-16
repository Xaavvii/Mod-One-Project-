require_relative "../lib/models/pizza.rb"
require_relative "../lib/models/topping.rb"

beef = Topping.find_or_create_by(name: "Beef")
extra_cheese = Topping.find_or_create_by(name: "Extra Cheese")
sausage = Topping.find_or_create_by(name: "Sausage")
bacon = Topping.find_or_create_by(name: "Bacon")
onions = Topping.find_or_create_by(name: "Onions")
mushrooms = Topping.find_or_create_by(name: "Mushrooms")
pepperoni = Topping.find_or_create_by(name: "Pepperoni")
black_olives = Topping.find_or_create_by(name: "Black Olives")
green_peppers = Topping.find_or_create_by(name: "Green Peppers")
red_peppers = Topping.find_or_create_by(name: "Red Peppers")
pineapple = Topping.find_or_create_by(name: "Pineapple")
spinach = Topping.find_or_create_by(name: "Spinach")
ham = Topping.find_or_create_by(name: "Ham")
philly_steak = Topping.find_or_create_by(name: "Philly Steak")

meatzza = Pizza.find_or_create_by(name: "MeatZZa")
extravanganZZa = Pizza.find_or_create_by(name: "ExtravaganZZa")
philly_cheese = Pizza.find_or_create_by(name: "Philly Cheese")
honolulu= Pizza.find_or_create_by(name: "Honolulu")
