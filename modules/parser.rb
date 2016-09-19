require_relative '../environment'

class Parser
  # TODO: check if incoming message is empty (at network module?)
  def self.run_cmd arg_alias, *arg_arg_array
    array = Array.new
    File.open($MODULE_CFG_NAME).find do |line|
      if line[0] == '#' then
        next
      end
      array.clear
      line.split(' ').each do |word|
        array.push word
      end
      array.shift == arg_alias
    end
    puts "debug - Parser::run_cmd: #{array.inspect}"
    # const_get gets class from string
    # method gets method from string 
    # shift pops the first element and returns its value
    # pass arguments as space delimited string
    # TODO: return value should not be couoled with wallet module
    return "You spent #{Object.const_get(array.shift).method(array.shift).call arg_arg_array[0]} today."
  end
end
