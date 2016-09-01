#!/usr/bin/ruby -w

require_relative 'modules/call-list'
require_relative 'modules/network'

db_file = File.new "db.d/call-list.db", "a+"
test_db = Database.new 

db_file.close
puts "fin."
