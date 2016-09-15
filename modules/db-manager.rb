#! /usr/bin/ruby

require 'fileutils'
require 'yaml'
require_relative '../environment'

class DBManager

# TODO: check that current file is not empty before overwriting backup
  def self.load arg_file_name
    file_name = $DB_DIR_NAME + arg_file_name
    content = ""
    if File.exist? file_name then
      #FileUtils.copy_file file_name, file_name + '.bkp'
      file = File.open file_name, "r"
      content = file.read
      object = YAML.load content
      file.close
      return object
    end
  end
  def self.save_bkp arg_file_name, arg_object
    file = File.open $DB_DIR_NAME + arg_file_name, 'w'
    file.write arg_object.to_yaml
    puts "debug - DBManager#save_bkp: #{arg_object.to_yaml}"
    file.close
  end
=begin
  def self.finalize arg_file_name
	  FileUtils.rm arg_file_name + '.bkp'
      file.close
  end
=end
end
