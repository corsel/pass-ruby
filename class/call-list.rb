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
end

class Person
  attr_accessor :name
  attr_accessor :date_array

  def initialize name
    @date_list = Array.new
    @name = name
  end
end 
