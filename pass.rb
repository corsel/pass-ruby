#!/usr/bin/ruby 
require_relative 'environment.rb'
require_relative 'modules/call-list'
require_relative 'modules/network'
require_relative 'modules/parser'
require_relative 'modules/wallet'

db_file = File.new "db.d/call-list.db", "a+"
test_db = Database.new 

Parser.run_cmd "gubuldak", "4 87"

db_file.close
puts "fin."
