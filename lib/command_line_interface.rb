class CommandLineInterface

attr_accessor :id,:new_pizza

  def welcome_customer
    puts "Welcome to Pizza Maker!"
  end

  def ask_for_customer_nane
    print "Please enter your name: "
    get_customer_selection
  end

  def get_customer_selection
    gets.chomp
  end

  def offer_specialty_or_custom_build_pizza(customer_name)
    puts "Hello #{customer_name}! Would you like to select a specialty pizza or build your own?"
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

  def show_menu_selection
    puts "Please enter in 1 if you like a specialty, or 2 if you like to build your own"
    puts "1. Specialty"
    puts "\n2. Custom"
  end


  def determine_speciality_or_custom(customer_selection)
    if customer_selection == "1"
      is_specialty_selected = true
      # display_special_menu
      is_specialty_selected
    elsif customer_selection == "2"
      is_specialty_selected = false
      # display_custom_menu
      is_specialty_selected
    end
    # customer_selection = get_customer_selection
  end

  # def determine_pizza_selection(pizza_selection)
  #   valid_menu_options = ["1","2","3","4"]
  #   valid_menu_options
  # end

  def display_menu(was_specialty_selected)
    if was_specialty_selected == true
      display_special_menu
    else
      display_custom_menu
    end
  end

  def display_special_menu
    valid_menu_options = ["1","2","3","4"]
    counter = 0
    puts "Here is our Speciality Menu. Please select a number."

    Pizza.all.each do |pizza|
      puts "#{pizza.id}. #{pizza.name}"
      counter += 1
      if counter >= 4
        break
      end
    end
    customer_selection = get_customer_selection
    while !valid_menu_options.include?(customer_selection)
      counter = 0
      puts "Please try again, you've made a wrong selection"
      puts "Here is our Speciality Menu. Please select a number."
      Pizza.all.each do |pizza|
        puts "#{pizza.id}. #{pizza.name}"
        counter += 1
        if counter >= 4
          break
        end
      end
      customer_selection = get_customer_selection
    end
    customer_selection
  end

  def display_custom_menu
    valid_menu_options = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14", "done"]
    topping_selection = ""
    @new_pizza = Pizza.create(name: "Custom Pizza")

    while topping_selection != "done"
      puts "Please select the number of the topping you want to add to your pizza!"
      puts "Enter 'done' when you are finished"

      Topping.all.map do |topping|
        puts "#{topping.id}. #{topping.name}"
      end

      topping_selection = get_customer_selection
      while !valid_menu_options.include?(topping_selection)
        puts "Please try again, you've made a wrong selection"
        puts "Please select the number of the topping you want to add to your pizza!"
        puts "Enter 'done' when you are finished"

        Topping.all.map do |topping|
          puts "#{topping.id}. #{topping.name}"
        end

        topping_selection = get_customer_selection
      end
      if topping_selection != "done"
        topping = Topping.find(topping_selection)
        PizzaTopping.new(pizza_id: @new_pizza.id, topping_id: topping.id)
        @new_pizza.toppings << topping
        puts "#{topping.name} has/have been added to your pizza."
      else
        puts "Do you want to name your pizza? Please enter 'yes' / 'no'"
        yes_no = gets.chomp
        if yes_no == 'yes'
          pizza_naming
        elsif yes_no == 'no'
          no_naming
        end
      end
      topping_selection
    end

    # @new_pizza
  end

  def complete_order

  end

  def topping_list(pizza_selection)
    @id = pizza_selection.to_i
    puts "You selected #{Pizza.find(@id).name}! These are the toppings on the pizza:"
    var = Pizza.all.find(@id).toppings
    var.map do |topping|
      puts topping.name.to_s
    end
  end

  def pizza_naming
  puts "Please name your pizza:"
  new_name = gets.chomp
  @new_pizza.name = new_name
  @new_pizza.save
  # binding.pry
  puts "Sweetza! You named your pizza #{new_name}"
  end

  def no_naming
    puts "Pizza's don't need no name anyway! Here is what's on your pizza:"
    puts @new_pizza.toppings.map {|topping| topping.name}
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
    was_specialty_selected = determine_speciality_or_custom(customer_selection)
    menu_selection = display_menu(was_specialty_selected)


    binding.pry
  end
end
