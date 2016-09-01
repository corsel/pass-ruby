#! /usr/bin/ruby

require 'socket'

def start_server
  server = TCPServer.new 6000
  conn = server.accept
  input = conn.readline.split
  conn.close
  return input
end
