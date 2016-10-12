require_relative '../environment'

class Parser
  def self.parse_cmd arg_string
    space_delim_array = arg_string.split ' '
    match_line_string = File.open($MODULE_CFG_NAME).find do |line|
      if line[0] == '#' then
        next
      end
      line.split(' ')[0] == space_delim_array[0]
    end
    return if match_line_string == nil
    match_line_array = match_line_string.split ' '
    puts "debug - Parser::parse_cmd: match_line_array: #{match_line_array.inspect}"
    class_name = match_line_array.shift(2)[1]
    method_name = match_line_array.shift
# TODO: handle nil arg_array (i.e. newday)
    arg_array = arg_string.split(' ')[1..-1]
    puts "debug - Parser::parse_cmd: class_name: #{class_name}, method name: #{method_name}, arg_array: #{arg_array.inspect}"
    if arg_array != nil then
      Object.const_get(class_name).method(method_name).call arg_array
    else
      Object.const_get(class_name).method(method_name).call 
    end
    # const_get gets class from string
    # method gets method from string 
    # shift pops the first element and returns its value
  end
end
