class Parser
  @@config_file

  def initialize
    @@config_file = File.new $MODULE_CFG_NAME, 'r'
    puts "#{@@config_file.readline}"
    puts "#{@@config_file.readline.split(' ')[0]}"
  end
end
