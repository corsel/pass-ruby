#!/usr/bin/ruby -w

require 'yaml'
require 'socket'
require_relative 'class/call-list'

server = TCPServer.new 6000
db_file = File.new "db.d/call-list.db", "a+"
test_db = Database.new 

server.listen 1
=begin
test_db.add_person "burcu", 10
test_db.add_person "cem", 10
test_db.add_person "mucver", 10
test_db.add_person "sylvester", 10
test_db.add_person "burcu", 10
test_db.add_person "mucver", 10
puts "#{test_db.inspect}"

foo = YAML.dump test_db
=end

db_file.close
puts "fin."
