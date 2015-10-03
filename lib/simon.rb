class SimonSays
  attr_reader :buffer

  LEFTMOST = 0

  def initialize(start_val)
    set_buffer(start_val)
  end

  def text
    buffer
  end

  def switch(pos1, pos2) 
    a = buffer[pos1]
    buffer[pos1] = buffer[pos2]
    buffer[pos2] = a
  end
  
  private

  def set_buffer(str)
    @buffer = str.gsub(/\s/, '')
  end
end
