require 'bundler'
Bundler.require

# ActiveRecord::Base.establish_connection( :adapter => "sqlite3", :database => "db/pizza_maker.sqlite")
# or
ActiveRecord::Base.establish_connection( { adapter: 'sqlite3', database: './db/pizza_maker.sqlite3' } )

require_all './lib'
