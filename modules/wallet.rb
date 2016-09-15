#! /usr/bin/ruby

require 'yaml'
require 'fileutils'
require_relative '../environment'

class Item
  attr_accessor :name
  attr_accessor :time
  attr_accessor :price
  attr_accessor :place
  attr_accessor :tag_array
  
  def initialize arg_name, arg_price, *arg_tag_array
    puts "debug - Item#initialize: \n\t#{arg_name}\n\t#{arg_price}\n\t#{arg_tag_array.inspect}"
    @name = arg_name
    @price = arg_price
    @tag_array = arg_tag_array
    @time = Time.now
  end
end

class ItemDB
  @item_array
  
  def initialize
    @item_array = Array.new
  end 
  def push arg_item
    @item_array.push arg_item
    puts "debug - ItemDB#push: #{@item_array.inspect}"
  end
end

class Wallet
  @daily_amount = 0
  @balance = 0
  @@active_db
  @@active_db_name = ""
  
  def initialize arg_db_name
    @@active_db_name = arg_db_name
    @@active_db = DBManager.load @@active_db_name
    @@active_db = ItemDB.new if !@@active_db 
    puts "debug - Wallet#initialize called: #{@@active_db.inspect}"
  end 
  def set_daily arg_amount
    @daily_amount = arg_amount
  end
  def self.spend *arg_item
    puts "debug - Wallet::spend called: #{arg_item.inspect}"
    @@active_db.push Item.new arg_item[0], arg_item[1], arg_item[2..-1]
    save_db
  end
  def self.save_db
    puts "debug - Wallet::save_db called: #{@@active_db_name}"
    DBManager.save_bkp @@active_db_name, @@active_db
  end
  def self.new_day
    puts "debug - Wallet::new_day called."
  end
end
