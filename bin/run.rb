#!/usr/bin/env ruby
require_relative '../config/environment'

# require 'rest-client'
require 'json'
require 'pry'

cli = CommandLineInterface.new
cli.run
