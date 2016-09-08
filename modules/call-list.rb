#! /usr/bin/ruby

require 'date'
require_relative '../environment'

class Database
  attr_accessor :person_array
  
  def initialize
    @person_array = Array.new
  end

  def add_person arg_name, arg_interval = 10
    unique_check = @person_array.select do |person|
      person.name == arg_name
    end
    if !unique_check.empty? then
      puts "person exists: #{unique_check.inspect}"
      return
    end
    @person_array.push Person.new arg_name, arg_interval
  end

  def call_person arg_name
    person_object = @person_array.select do |person|
      person.name.eql? arg_name
    end
    if !person_object.empty? then
      person_object[0].called
    else
      puts "error - person not found: #{arg_name}"
    end
  end

  def who_to_call
    call_array = @person_array.select do |person|
      person.should_call?
    end
    return call_array
  end
end

class Person
  attr_accessor :name
  attr_accessor :date_array
  attr_accessor :expected_interval
  @interval_array
  @average_interval

  def initialize arg_name, arg_interval
    @date_list = Array.new
    @name = arg_name
    @set_interval = 0.0
    @interval_array = Array.new
    @average_interval = 0.0
    @expected_interval = arg_interval
  end

  def recalc_average
    if @interval_array.size < 1 then return end
    @average_interval = @interval_array.inject do |tmp, n|
      tmp += n
    end
    @average_interval /= @interval_array.size
  end
  
  def should_call?
    if Date.today - @date_list.last <= @expected_interval then
      return false
    else
      return true
    end
  end

  def called
    @date_list.push Date.today
    if @date_list.size >= 2 then
      add_list = lambda do 
        (@date_list[-1] - @date_list[-2]).to_i
      end
    @interval_array.push add_list.call
    end
    recalc_average
  end 

  def called_debug arg_days_ago
    @date_list.push Date.today.prev_day arg_days_ago
    if @date_list.size >= 2 then
      add_list = lambda do 
        (@date_list[-1] - @date_list[-2]).to_i
      end
    @interval_array.push add_list.call
    end
    recalc_average
  end
end 
