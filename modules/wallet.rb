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
  attr_accessor :item_array
  
  def initialize
    @item_array = Array.new
  end 
  def push arg_item
    @item_array.push arg_item
  end
  def clean_null 
    @item_array = @item_array.select do |elem|
      !elem.tag_array.include? 'null'
    end
  end
end

class Program
  attr_accessor :balance
  attr_accessor :daily_amount
  attr_accessor :spent_today
  attr_accessor :last_update
  def initialize
    @balance = 0
    @daily_amount = 0
    @spent_today = 0
    @last_update = Time.now
  end
end

class Wallet
  # too many static vars and methods. reiterate for better oop.
  @@active_program
  @@active_program_name = "" 
  @@active_db
  @@active_db_name = ""
  
  def initialize arg_db_name, arg_program_name
    @@active_db_name = arg_db_name
    @@active_db = DBManager.load @@active_db_name
    @@active_db = ItemDB.new if !@@active_db 

    @@active_program_name = arg_program_name
    @@active_program = DBManager.load @@active_program_name
    @@active_program = Program.new if !@@active_program
  end 
  def self.save_db
    DBManager.save @@active_db_name, @@active_db
    DBManager.save @@active_program_name, @@active_program
  end
  def self.clean_null 
    @@active_db.clean_null
  end
  def self.routine 
    clean_null
    save_db
  end
  def self.set_daily arg_amount
    DBManager.archive @@active_db_name   
    DBManager.archive @@active_program_name
    @@active_program = Program.new 
    @@active_db = ItemDB.new 
    @@active_program.daily_amount = arg_amount[0].to_f
    @@active_program.spent_today = 0
    @@active_program.balance = 0
    routine
  end
  def self.spend arg_item
    puts "debug - Wallet::spend: spend called."
    # TODO: double dereference problem unsolved! also, make tags into array ([0][2])
    @@active_db.push Item.new arg_item[0], arg_item[1], arg_item[2].split(',')
    puts "debug - Wallet::spend: #{arg_item[2].split(',').inspect}"
    @@active_program.spent_today += arg_item[1].to_f
    @@active_program.balance -= arg_item[1].to_f
    routine
    return @@active_program.spent_today
  end
  def self.new_day arg_void
    @@active_program.balance += @@active_program.daily_amount.to_f
    @@active_program.spent_today = 0
    @@active_program.last_update = Time.now
    routine
  end
end
