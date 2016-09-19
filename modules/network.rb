#! /usr/bin/ruby

require 'socket'
require_relative 'parser' 
require_relative '../environment'

class NetworkManager
  def self.run_server
    server = TCPServer.new 6000
    #thread = Thread.new do
    server.listen 10
      while true do
        input = Array.new
        conn = server.accept
        conn.readline.split.each do |word|
          input.push word
        end
        # TODO: join here, split again in parser. pointless... fix it. 
        puts "debug - NetworkManager::run_server: #{Parser.run_cmd input[0], input[1..-1]}"
        conn.close
      end
    #end
    #thread.join
  end
end
