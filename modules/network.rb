#! /usr/bin/ruby

require 'socket'
require_relative 'parser' 
require_relative '../environment'

class NetworkManager
  def self.run_server arg_port = 6000
    server = TCPServer.new arg_port
    puts "debug - NetworkManager::run_server: server started: #{server.inspect}"
    server.listen 10
      while true do
        conn = server.accept
        Parser.parse_cmd conn.readline
        conn.close
      end
  end
end
