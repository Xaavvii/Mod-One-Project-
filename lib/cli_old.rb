class CommandLineInterface

attr_accessor :id

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
    puts "1. Specialty"
    puts "\n2. Custom"
  end

  def get_customer_selection
    gets.chomp
  end

  def display_special_menu
    puts "Here is our Speciality Menu. Please select a number."
    Pizza.all.each do |pizza|
      puts "#{pizza.id}. #{pizza.name}"
    end
  end

  def topping_list(pizza_selection)
    @id = pizza_selection.to_i
    puts "You selected #{Pizza.find(@id).name}! These are the toppings on the pizza:"
    var = Pizza.all.find(@id).toppings
    var.map do |topping|
      puts topping.name.to_s
    end
  end

  def display_custom_menu
    puts "Custom Menu not yet available."
  end

  def determine_customer_selection(customer_selection)
    if customer_selection == "1"
      display_special_menu
    elsif customer_selection == "2"
      display_custom_menu
    else
      puts "Wrong input, please try again."
    end
    customer_selection
  end

  def determine_pizza_selection(pizza_selection)
    if pizza_selection <= Pizza.all.length

    else
      puts "Wrong input, please try again."
    end
  end

  def run
    customer_selection = ""
    pizza_selection = ""
    welcome_customer
    customer_name = ask_for_customer_nane

    until customer_selection == "1" || customer_selection == "2" do
      offer_specialty_or_custom_build_pizza(customer_name)
      show_menu_selection
      customer_selection = get_customer_selection
      # determine_customer_selection(pizza_selection)
      # until pizza_selection == "1" || pizza_selection == "2" || pizza_selection  ==  "3" || pizza_selection == "4" do
      #   pizza_selection = get_customer_selection
      # end
    end

    if customer_selection == "1"
      topping_list(pizza_selection)

    elsif customer_selection == "2"
      puts "Sorry, custom menu not available"
    end

    binding.pry


  end
end
