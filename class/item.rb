class Item
  attr_reader :created_on
  attr_accessor :start # deadline
  attr_accessor :end # deadline
  @note_array
  def initialize
    @created_on = DateTime.now
    @note_array = Array.new
    @start = 3
    @end = 5
  end
end
