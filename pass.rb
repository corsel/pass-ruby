#!/usr/bin/ruby 

require_relative 'environment.rb'
require_relative 'modules/call-list'
require_relative 'modules/network'
require_relative 'modules/parser'

db_file = File.new "db.d/call-list.db", "a+"
test_db = Database.new 

dummy = Parser.new
puts "parser test: #{dummy.inspect}"

puts "env test: dir: #{$DIR_NAME}"
puts "env test: db dir: #{$DB_DIR_NAME}"
puts "env test: module cfg: #{$MODULE_CFG_NAME}"

db_file.close
puts "fin."
