#! /usr/bin/ruby

require 'socket'
require_relative 'parser' 
require_relative '../environment'

class NetworkManager
  def self.start_server
    server_alive = true
    server = TCPServer.new 6000
    thread = Thread.new do
      server.listen 1
      conn = server.accept
      input = conn.readline.split
      conn.close
      # TODO: join here, split again in parser. pointless... fix it. 
      Parser.run_cmd input[0], input[1..-1].join(' ')
    end
    thread.join
  end
end
