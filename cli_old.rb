# class CommandLineInterface

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
          raise "Alex"
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
# end














class CommandLineInterface

attr_accessor :id,:new_pizza,:customer_name

  def welcome_customer
    puts "Welcome to Pizza Maker!".colorize(:green)
  end

  def ask_for_customer_nane
    print "Please enter your name :".colorize(:white)
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


  def determine_specialty_or_custom(customer_selection)
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
    confirm_specialty_selection = ""
    puts "Here is our Specialty Menu. Please select a number."

    Pizza.all.each do |pizza|
      puts "#{pizza.id}. #{pizza.name}"
      counter += 1
      if counter >= 4
        break
      end
    end
    specialty_selection = get_customer_selection
    while !valid_menu_options.include?(specialty_selection)
      counter = 0
      puts "Please try again, you've made a wrong selection"
      puts "Here is our specialty Menu. Please select a number."
      Pizza.all.each do |pizza|
        puts "#{pizza.id}. #{pizza.name}"
        counter += 1
        if counter >= 4
          break
        end
      end
      specialty_selection = get_customer_selection
    end
    topping_list(specialty_selection)
    puts "Do you want this pizza? Please enter 'yes' / 'no'"
    confirm_specialty_selection = get_customer_selection
    if confirm_specialty_selection == "yes"
      puts "Sweetza! You have your pizza."
      where_to_next
    elsif confirm_specialty_selection == "no"
      where_to_next
    else
      puts "Please try again, you've made a wrong selection"
      display_special_menu
    end
  end

  def display_custom_menu
    valid_menu_options = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14", "done"]
    selection_array = []
    topping_selection = ""
    @new_pizza = Pizza.create(name: "Custom Pizza")

    while topping_selection != "done"
      puts "Please select the number of the topping you want to add to your pizza!"
      puts "Enter 'done' when you are finished"

      Topping.all.each do |topping|
        if !selection_array.include?(topping.id.to_s)
          puts "#{topping.id}. #{topping.name}"
        end
        # puts "#{topping.id}. #{topping.name}"
      end

      topping_selection = get_customer_selection


      while !valid_menu_options.include?(topping_selection)
        puts "Please try again, you've made a wrong selection"
        puts "Please select the number of the topping you want to add to your pizza!"
        puts "Enter 'done' when you are finished"

        Topping.all.each do |topping|
          if !selection_array.include?(topping.id.to_s)
            puts "#{topping.id}. #{topping.name}"
          end
        end
        topping_selection = get_customer_selection
      end
      if topping_selection != "done"
        topping = Topping.find(topping_selection)
        PizzaTopping.new(pizza_id: @new_pizza.id, topping_id: topping.id)
        @new_pizza.toppings << topping
        puts "#{topping.name} has/have been added to your pizza."
        selection_array << topping_selection
      else
        puts "Do you want to name your pizza? Please enter 'yes' / 'no'"
        yes_no = gets.chomp
        if yes_no == 'yes'
          pizza_naming
        elsif yes_no == 'no'
          no_naming
        end
        where_to_next
      end
      topping_selection
    end

    # @new_pizza
  end

  def complete_order

  end

  def topping_list(specialty_selection)
    @id = specialty_selection.to_i
    puts "You selected #{Pizza.find(@id).name}! These are the toppings on the pizza:"
    selected_specialty_pizza = Pizza.all.find(@id).toppings
    selected_specialty_pizza.map do |topping|
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

  def where_to_next
    puts "Would you like another pizza, go back to the main menu, or end your session?"
    puts "1. Get a specialty pizza"
    puts "\n2. Make a new custom pizza"
    puts "\n3. Go back to the main menu"
    puts "\n4. End your pizza making session"
    menu_input = get_customer_selection
      if menu_input == '1'
        display_special_menu
      elsif menu_input == '2'
        # show_menu_selection
        display_custom_menu
      elsif menu_input == '3'
        run
      elsif menu_input == '4'
        raise "The program has ended"
      end
  end

  def topping_helper
    PizzaTopping.all.map do |pizza_topping|
      pizza_topping.topping_id
    end
  end

  def most_popular
    popular = topping_helper.group_by(&:to_s).values.max_by(&:size).try(:first)
    pop_top = Topping.find(popular).name
    puts "The most popular topping is #{pop_top}."
  end

  def run

    welcome_customer
    while @customer_name == nil
      @customer_name = ask_for_customer_nane
    end

    offer_specialty_or_custom_build_pizza(@customer_name)
    customer_selection = determine_customer_selection
    was_specialty_selected = determine_specialty_or_custom(customer_selection)
    display_menu(was_specialty_selected)


    binding.pry
  end
end
