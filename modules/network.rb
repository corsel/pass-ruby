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
        conn = server.accept
        input = conn.readline.split
        # TODO: join here, split again in parser. pointless... fix it. 
        puts "debug - NetworkManager::run_server: #{Parser.run_cmd input[0], input[1..-1].join(' ')}"
        conn.puts "hello\r\n"
        conn.close
      end
    #end
    #thread.join
  end
end
