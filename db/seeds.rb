require_relative "../lib/models/pizza.rb"
require_relative "../lib/models/topping.rb"

#Toppings
beef = Topping.find_or_create_by(name: "Beef") #1
Topping.find_or_create_by(name: "Extra Cheese") #2
Topping.find_or_create_by(name: "Sausage") #3
Topping.find_or_create_by(name: "Bacon") #4
Topping.find_or_create_by(name: "Onions") #5
Topping.find_or_create_by(name: "Mushrooms") #6
Topping.find_or_create_by(name: "Pepperoni") #7
Topping.find_or_create_by(name: "Black Olives") #8
Topping.find_or_create_by(name: "Green Peppers") #9
Topping.find_or_create_by(name: "Red Peppers") #10
Topping.find_or_create_by(name: "Pineapple") #11
Topping.find_or_create_by(name: "Spinach") #12
Topping.find_or_create_by(name: "Ham") #13
Topping.find_or_create_by(name: "Philly Steak") #14

#Specialty Pizzas
Pizza.find_or_create_by(name: "MeatZZa") #1
Pizza.find_or_create_by(name: "ExtravaganZZa") #2
Pizza.find_or_create_by(name: "Philly Cheese") #3
Pizza.find_or_create_by(name: "Honolulu") #4


#####PIZZATOPPINGS ASSOCIATIONS#######

#Meatzza
PizzaTopping.find_or_create_by(pizza_id: 1, topping_id: 1)
PizzaTopping.find_or_create_by(pizza_id: 1, topping_id: 3)
PizzaTopping.find_or_create_by(pizza_id: 1, topping_id: 7)
PizzaTopping.find_or_create_by(pizza_id: 1, topping_id: 13)

#ExtravaganZZa
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 5)
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 9)
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 8)
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 6)
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 1)
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 13)
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 7)
PizzaTopping.find_or_create_by(pizza_id: 2, topping_id: 3)

#PhillyCheese
PizzaTopping.find_or_create_by(pizza_id: 3, topping_id: 14)
PizzaTopping.find_or_create_by(pizza_id: 3, topping_id: 5)
PizzaTopping.find_or_create_by(pizza_id: 3, topping_id: 6)
PizzaTopping.find_or_create_by(pizza_id: 3, topping_id: 9)

#Honolulu
PizzaTopping.find_or_create_by(pizza_id: 4, topping_id: 11)
PizzaTopping.find_or_create_by(pizza_id: 4, topping_id: 13)
PizzaTopping.find_or_create_by(pizza_id: 4, topping_id: 4)
PizzaTopping.find_or_create_by(pizza_id: 4, topping_id: 10)
