#! /usr/bin/ruby

# author: cem orsel
# version: 1.0.1

require_relative 'environment.rb'
require_relative 'modules/db-manager'
require_relative 'modules/network'
require_relative 'modules/parser'
require_relative 'modules/wallet'

wallet = Wallet.new "wallet-record.db", "wallet-program.db"

NetworkManager.run_server 6000

puts "fin."
