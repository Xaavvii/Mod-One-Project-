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
    puts "1. Specialty"
    puts "\n2. Custom"
  end

  def get_customer_selection
    gets.chomp
  end

  def display_special_menu
    puts "Here is our Speciality Menu. Please select a number."

    Pizza.all.each do |pizza|
      array = []
      array << "#{pizza.id}. #{pizza.name}"
      puts array[0]
      puts array[1]
      puts array[2]
      puts array[3]
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


  def topping_list(pizza_selection)
    @id = pizza_selection.to_i
    puts "You selected #{Pizza.find(@id).name}! These are the toppings on the pizza:"
    var = Pizza.all.find(@id).toppings
    var.map do |topping|
      puts topping.name.to_s
    end
  end

  def display_custom_menu
    topping_selection = ""
    @new_pizza = Pizza.create(name: "Custom Pizza")

    while topping_selection != "done"
      puts "Please enter the number of the topping you want to add to your pizza!"
      puts "Enter 'done' when you are finished"

      Topping.all.map do |topping|
        puts "#{topping.id}. #{topping.name}"
      end

      topping_selection = gets.chomp
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
            # puts "Please name your pizza:"
            # new_name = gets.chomp
            # @new_pizza.name = new_name
            # @new_pizza.save
            # # binding.pry
            # puts "Sweetza! You named your pizza #{new_name}"
          elsif yes_no == 'no'
            no_naming
            # puts "Pizza's don't need no name anyway! Here is what's on your pizza:"
            # puts @new_pizza.toppings.map {|topping| topping.name}
          else
            puts

            # binding.pry
          end
      end
    end
  end

  def create_pizza
    custom_pizza = Pizza.new(name: null)
    PizzaTopping.new(pizza_id: custom_pizza.id, topping_id: 1)
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
    if pizza_selection.to_i <= Pizza.all.length

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
      until pizza_selection == "1" || pizza_selection == "2" || pizza_selection == "3" || pizza_selection == "4" do
        determine_customer_selection(customer_selection)
        pizza_selection = get_customer_selection
        valid_pizza_options = ["1", "2", "3", "4"]
        if !valid_pizza_options.include?(pizza_selection)
          # raise "Alex"
          puts "Wrong input, please try again!!!!"
        end
      end
    end

    if customer_selection == "1"
      topping_list(pizza_selection)
    elsif customer_selection == "2"
      puts "Sorry, custom menu not available"
    end
    #
    # binding.pry


  end
end
