#!/usr/bin/env ruby
require_relative '../config/environment'

# require 'rest-client'
require 'json'
require 'pry'

print "Welcome to Pizza Maker!"
puts

print "Please enter your name:"
puts
name_input = gets.chomp

puts "Hello #{name_input}! Would you like to select a specialty pizza or build your own?"
show_menu_selection


user_selection = ""
user_selection = gets.chomp

if user_selection == "1"
  display_special_menu
elsif user_selection == "2"
  display_custom_menu
else
  puts "Wrong input, please try again"
end

print "test"



# if menu_selection == "1"
#   display_special_menu
# elsif menu_selection == "2"
#   display_custom_menu
# else
#   puts "Wrong input, please try again"
#   show_menu_selection
#   menu_selection = gets.chomp
# end

binding.pry

0
