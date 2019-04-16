#!/usr/bin/env ruby
require_relative '../config/environment'

# require 'rest-client'
require 'json'
require 'pry'

puts "Welcome to Pizza Maker!"

puts "Please enter your name:"

name_input = gets.chomp

puts "Hello #{name_input}! Would you like to select a specialty pizza or build your own?"

puts "1. specialty"

puts "2. custom"

input = gets.chomp
