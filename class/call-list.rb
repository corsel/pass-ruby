require 'yaml' 

class Database
  attr_accessor :person_array
  
  def initialize
    @person_array = Array.new
  end
  def add_person name
    unique_check = @person_array.select do |person|
      person.name == name
    end
    if !unique_check.empty? then
      puts "person exists: #{unique_check.inspect}"
      return
    end
    @person_array.push Person.new name
  end
  def call_person name
    person_object = @person_array.select do |person|
      person.name.eql? name
    end
    if !person_object.empty? then
      person_object[0].called
    end
  end
end

class Person
  attr_accessor :name
  attr_accessor :date_array
  attr_accessor :expected_interval
  @interval_array
  @average_interval

  def initialize name
    @date_list = Array.new
    @name = name
    @set_interval = 0.0
    @interval_array = Array.new
    @average_interval = 0.0
  end

  def recalc_average
    if @interval_array.size < 1 then return end
    @average_interval = @interval_array.inject do |tmp, n|
      tmp += n
    end
    @average_interval /= @interval_array.size
  end
  
  def should_call?
    if Time.now - @date.list.last <= @expected_interval then
      return false
    else
      return true
    end
  end

  def called
    @date_list.push Time.now
    if @date_list.size >= 2 then
      add_list = lambda do 
        @date_list.last(2)[1] - @date_list.last(2)[0]
      end
    @interval_array.push add_list.call
    end
    recalc_average
  end 
end 
