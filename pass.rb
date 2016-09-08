#! /usr/bin/ruby 

require_relative 'environment.rb'
require_relative 'modules/call-list'
require_relative 'modules/db-manager'
require_relative 'modules/network'
require_relative 'modules/parser'
require_relative 'modules/wallet'

=begin
db_file = File.new "db.d/call-list.db", "a+"
test_db = Database.new 
db_file.close
=end

item_test = Item.new "my_name", "my_price", (1..7).to_a
puts "debug - item test: #{item_test.inspect}"

dbman_test = DBManager.new "foo.db"
dbman_test.save_db item_test
dbman_test.finalize

Parser.run_cmd "gubuldak", "4 87"

puts "fin."
