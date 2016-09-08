#! /usr/bin/ruby

require 'socket'
require_relative '../environment'

def start_server
  server = TCPServer.new 6000
  conn = server.accept
  input = conn.readline.split
  conn.close
  return input
end
