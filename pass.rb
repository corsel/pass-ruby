#!/usr/bin/ruby -w

require 'yaml'
require_relative 'class/call-list'

db_file = File.new "db.d/call-list.db", "a+"

test_db = Database.new 
test_db.add_person "burcu", 10
test_db.add_person "cem", 10
test_db.add_person "mucver", 10
test_db.add_person "sylvester", 10
test_db.add_person "burcu", 10
test_db.add_person "mucver", 10
puts "#{test_db.inspect}"

db_file.close
puts "fin."
