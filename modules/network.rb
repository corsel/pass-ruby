#! /usr/bin/ruby

require 'socket'
require_relative 'parser' 
require_relative '../environment'

class NetworkManager
  def self.run_server arg_port = 5000
    server = TCPServer.new arg_port
    #thread = Thread.new do
    server.listen 10
      while true do
        input = Array.new
        conn = server.accept
        conn.readline.split.each do |word|
          input.push word
        end
        # TODO: join here, split again in parser. pointless... fix it. 
        begin
          puts "debug - NetworkManager::run_server: #{Parser.run_cmd input[0], input[1..-1]}"
        rescue
          puts "error - non-standard input. ignoring..."
        end
        conn.close
      end
    #end
    #thread.join
  end
end
