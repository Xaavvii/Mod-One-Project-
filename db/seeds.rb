require_relative "../lib/models/pizza.rb"
require_relative "../lib/models/topping.rb"

Topping.find_or_create_by(name: "Beef")
Topping.find_or_create_by(name: "Extra Cheese")
Topping.find_or_create_by(name: "Sausage")
Topping.find_or_create_by(name: "Bacon")
Topping.find_or_create_by(name: "Onions")
Topping.find_or_create_by(name: "Mushrooms")
Topping.find_or_create_by(name: "Pepperoni")
Topping.find_or_create_by(name: "Black Olives")
Topping.find_or_create_by(name: "Green Peppers")
Topping.find_or_create_by(name: "Red Peppers")
Topping.find_or_create_by(name: "Pineapple")
Topping.find_or_create_by(name: "Spinach")
Topping.find_or_create_by(name: "Ham")
Topping.find_or_create_by(name: "Philly Steak")

Pizza.find_or_create_by(name: "MeatZZa")
Pizza.find_or_create_by(name: "ExtravaganZZa")
Pizza.find_or_create_by(name: "Philly Cheese")
Pizza.find_or_create_by(name: "Honolulu")
