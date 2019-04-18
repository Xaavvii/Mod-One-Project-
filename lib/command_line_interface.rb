class CommandLineInterface

attr_accessor :id,:new_pizza

  def welcome_customer
    puts "Welcome to Pizza Maker!"
  end

  def ask_for_customer_nane
    print "Please enter your name: "
    gets.chomp
  end

  def offer_specialty_or_custom_build_pizza(customer_name)
    puts "Hello #{customer_name}! Would you like to select a specialty pizza or build your own?"
  end

  def show_menu_selection
    puts "Please enter in 1 if you like a specialty, or 2 if you like to build your own"
    puts "1. Specialty"
    puts "\n2. Custom"
  end

  def get_customer_selection
    gets.chomp
  end

  def display_special_menu
    counter = 0
    puts "Here is our Speciality Menu. Please select a number."

    Pizza.all.each do |pizza|
      puts "#{pizza.id}. #{pizza.name}"
      counter += 1
      if counter >= 4
        break
      end
    end
  end


  def display_custom_menu
    topping_selection = ""
    @new_pizza = Pizza.create(name: "custom")

    while topping_selection != "done"
      puts "Please select the number of the topping you want to add to your pizza!"
      puts "Enter 'done' when you are finished"

      Topping.all.map do |topping|
        puts "#{topping.id}. #{topping.name}"
      end

      topping_selection = gets.chomp
      if topping_selection != "done"
        topping = Topping.find(topping_selection)
        PizzaTopping.new(pizza_id: pizza.id, topping_id: topping.id)
        puts "#{topping.name} has/have been added to your pizza."
      end
    end

    pizza
  end

  def determine_customer_selection
    valid_menu_options = ["1","2"]
    show_menu_selection
    customer_selection = get_customer_selection
    while !valid_menu_options.include?(customer_selection)
        puts "Please try again, you've made a wrong selection"
        show_menu_selection
        customer_selection = get_customer_selection
    end
    customer_selection
  end

  def determine_speciality_or_custom(customer_selection)
    if customer_selection == "1"
      display_special_menu
    elsif customer_selection == "2"
      display_custom_menu
    end
    customer_selection = get_customer_selection
  end

  def determine_pizza_selection(pizza_selection)
    valid_menu_options = ["1","2","3","4"]
    valid_menu_options
  end

  def topping_list(pizza_selection)
    @id = pizza_selection.to_i
    puts "You selected #{Pizza.find(@id).name}! These are the toppings on the pizza:"
    var = Pizza.all.find(@id).toppings
    var.map do |topping|
      puts topping.name.to_s
    end
  end

  def create_pizza
    custom_pizza = Pizza.new(name: null)
    PizzaTopping.new(pizza_id: custom_pizza.id, topping_id: 1)
  end

  def run
    welcome_customer
    customer_name = ask_for_customer_nane
    offer_specialty_or_custom_build_pizza(customer_name)
    customer_selection = determine_customer_selection
    is = determine_speciality_or_custom(customer_selection)



    binding.pry
  end
end
