#! /usr/bin/ruby 

require_relative '../environment.rb'

class Scheduler
  @@daily_callback_array
  @@time_prev

  def self.run_service
    @@daily_callback_array = Array.new
    @@time_prev = Time.now
    loop do
      if @@time_prev.min != Time.now.min then
        puts "debug - Scheduler::run: new minute: #{Time.now.min}"
        @@time_prev = Time.now
      end
    end
  end
end
