#! /usr/bin/ruby

require 'fileutils'
require 'yaml'
require_relative '../environment'

class DBManager
  @file
  @file_name
  
# TODO: check that current file is not empty before overwriting backup
  def initialize arg_file_name
    @file_name = $DB_DIR_NAME + arg_file_name
    if File.exist? @file_name + 'bkp' then
      puts "warning - backup file exists: #{@file_name + '.bkp'}. resolve conflict before continuing."
      return
    end
    if File.exist? @file_name then
      FileUtils.copy_file @file_name, @file_name + '.bkp'
    end 
    content = IO.read @file_name
    puts "debug - DBManager#initialize: deserialized contents: #{content.inspect}"
    @file = File.open @file_name, 'w+'
  end
  def finalize
	  FileUtils.rm @file_name + '.bkp'
      @file.close
  end
  def save_db arg_object
    if !@file.nil? then
      @file.write arg_object.to_yaml
    end
  end
end
