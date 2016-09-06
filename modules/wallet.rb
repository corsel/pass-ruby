class Wallet
  @daily_amount = 0
  @balance = 0
 
  def self.set_daily arg_amount
    @daily_amount = arg_amount
  end
  def self.spent *arg_amount
    puts "debug - Wallet::spent #{arg_amount[0]}, #{arg_amount[1]}"
  end
  def self.new_day
    puts "debug - Wallet::new_day called."
  end
end
