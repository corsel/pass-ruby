#! /usr/bin/ruby 

require_relative '../environment.rb'

class Scheduler
  @@daily_callback_array
  @@time_prev

  def self.run_server
    puts "debug - Scheduler::run_server: called." 
    @@daily_callback_array = Array.new
    @@time_prev = Time.now
    loop do
      if @@time_prev.min != Time.now.min then
        puts "debug - Scheduler::run: new minute: #{Time.now.min}"
        @@time_prev = Time.now
      end
    end
  end
  def self.register_func
  end
end
