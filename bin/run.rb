# !/usr/bin/env ruby
require_relative '../config/environment'

# require 'rest-client'
require 'json'
require 'pry'
require 'colorize'
require 'colorized_string'

cli = CommandLineInterface.new
cli.run
