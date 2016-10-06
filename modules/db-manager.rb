#! /usr/bin/ruby

require 'fileutils'
require 'yaml'
require_relative '../environment'

class DBManager
  def self.load arg_file_name
    file_name = $DB_DIR_NAME + arg_file_name
    content = ""
    if File.exist? file_name then
      file = File.open file_name, "r"
      content = file.read
      object = YAML.load content
      file.close
      return object
    end
  end
  def self.save arg_file_name, arg_object
    file = File.open $DB_DIR_NAME + arg_file_name, 'w'
    file.write arg_object.to_yaml
    puts "debug - DBManager#save: #{arg_object.to_yaml}"
    file.close
  end
  def self.remove arg_file_name
    File.delete arg_file_name
  end
  def self.archive arg_file_name
    if !File.exists? $DB_DIR_NAME + arg_file_name then
      return
    end
    FileUtils.mv($DB_DIR_NAME + arg_file_name, $DB_DIR_NAME + arg_file_name + "." + Time.now.strftime("%y%m%d"))
  end
end
