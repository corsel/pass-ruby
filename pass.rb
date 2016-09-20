#! /usr/bin/ruby

require_relative 'environment.rb'
require_relative 'modules/call-list'
require_relative 'modules/db-manager'
require_relative 'modules/network'
require_relative 'modules/parser'
#require_relative 'modules/scheduler'
require_relative 'modules/wallet'

wallet = Wallet.new "wallet-record.db", "wallet-program.db"
=begin
scheduler_thread = Thread.new do
  Scheduler.run_service
end
=end
#network_thread = Thread.new do
  NetworkManager.run_server
#end

#scheduler_thread.join
#network_thread.join

puts "fin."
