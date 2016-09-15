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
=begin
item_db = ItemDB.new
item_test = Item.new "my_name", "my_price", (1..7).to_a
item_db.push item_test
item_test = Item.new "my_name_2", "my_price_2", (5..8).to_a
item_db.push item_test
=end

wallet = Wallet.new "foo.db"

NetworkManager.start_server

puts "fin."
