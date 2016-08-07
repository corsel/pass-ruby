#!/usr/bin/ruby -w

require 'yaml'
require_relative 'class/call-list'

db_file = File.new "db.d/call-list.db", "a+"

test_db = Database.new 
test_db.add_person "burcu"
test_db.add_person "cem"
test_db.add_person "mucver"
test_db.add_person "sylvester"
test_db.add_person "burcu"
test_db.add_person "mucver"
puts "#{test_db.inspect}"

test_db.call_person "mucver"
sleep 3
test_db.call_person "mucver"
sleep 3
test_db.call_person "burcu" 
sleep 3
test_db.call_person "mucver"
sleep 3
test_db.call_person "sylvester"
sleep 3
test_db.call_person "burcu"

puts "\n\ndebug - array: #{test_db.person_array.inspect}"

db_file.close

puts "fin."
