#! /usr/bin/ruby

require 'yaml'
require 'fileutils'
require_relative '../environment'

class Item
  attr_accessor :name
  attr_accessor :price
  attr_accessor :place
  attr_accessor :tag_array
  
  def initialize arg_name, arg_price, *arg_tag_array
    @name = arg_name
    @price = arg_price
    @tag_array = arg_tag_array
  end
end

class ItemDB
  @item_array
  @db_file_name
  @db_file
  
  def initialize arg_db_file_name
    @db_file_name = arg_db_file_name
    @db_file = File.open $DB_DIR_NAME + arg_db_file_name, 'a+'
  end
  def save_db
  end 
  def load_db
  
  end
end

class Wallet
  @daily_amount = 0
  @balance = 0
 
  def self.set_daily arg_amount
    @daily_amount = arg_amount
  end
  def self.spent *arg_amount
    puts "debug - Wallet::spent #{arg_amount[0]}, #{arg_amount[1]}"
  end
  def self.new_day
    puts "debug - Wallet::new_day called."
  end
end
