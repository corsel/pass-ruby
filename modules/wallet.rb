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
  end
end

class Wallet
  # too many static vars and methods. reiterate for better oop.
  @@daily_amount = 0
  @@spent_today = 0
  @balance = 0
  @@active_db
  @@active_db_name = ""
  
  def initialize arg_db_name
    @@active_db_name = arg_db_name
    @@active_db = DBManager.load @@active_db_name
    @@active_db = ItemDB.new if !@@active_db 
  end 
  def self.set_daily arg_amount
    @@daily_amount = arg_amount
    @@spent_today = 0
    @balance = 0
  end
  def self.spend *arg_item
    # TODO: double dereference problem unsolved! also, make tags into array ([0][2])
    @@active_db.push Item.new arg_item[0][0], arg_item[0][1], arg_item[0][2]
    @@spent_today += arg_item[0][1].to_f
    save_db
    return @@spent_today
  end
  def self.save_db
    DBManager.save @@active_db_name, @@active_db
  end
  def self.new_day
  end
end
