class CommandLineInterface

attr_accessor :name

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
      @name = pizza.name
      id = pizza.id
      puts "#{id}. #{name}"
      binding.pry
    end
  end

  def topping_list
    puts "You selected #{@name}! These are the toppings on the pizza:"
    puts ""

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


  def run
    customer_selection = ""
    welcome_customer
    customer_name = ask_for_customer_nane

    until customer_selection == "1" || customer_selection == "2" do
      offer_specialty_or_custom_build_pizza(customer_name)
      show_menu_selection
      customer_selection = get_customer_selection
      determine_customer_selection(customer_selection)
      pizza_selection = get_customer_selection
    end
    binding.pry
  end
end
