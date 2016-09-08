require_relative '../environment'

class Parser
  def self.run_cmd arg_alias, arg_arg_string
    array = Array.new
    matching_line = File.open($MODULE_CFG_NAME).find do |line|
      if line[0] == '#' then
        next
      end
      array = line.split(' ')
      array.shift == arg_alias
    end
    #const_get gets class from string
    #method gets method from string 
    #shift pops the first element and returns its value
    #pass arguments as space delimited string
    Object.const_get(array.shift).method(array.shift).call arg_arg_string.split(' ')
    puts "debug - Parser#initialize: found match: #{matching_line}"
  end
end
