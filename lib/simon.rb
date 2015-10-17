module SimonSays

  LEFTMOST = 0

  # Switch letters at pos1 and pos2
  def self.switch(str, pos1, pos2) 
    a = str[pos1]
    str[pos1] = str[pos2]
    str[pos2] = a
    str
  end

  # like String::partition, but by index
  def self.index_partition(str, index)
    a = str[0, index] || ''
    b = str[index] || ''
    c = str[index+1, str.size-index] || ''
    [a, b, c]
  end

  # Remove letter at pos
  def self.delete(str, pos) 
    #TODO: Handle position outside range?
    arr = self.index_partition(str, pos)
    arr[0] + arr[2]
  end

  # Return the index of the rightmost character
  def self.rightmost_pos(str)
    #TODO: empty check?
    str.size - 1
  end

  # Insert letter at specified position
  def self.insert(str, pos, letter)
    arr = self.index_partition(str, pos)
    arr[0] + letter + arr[1] + arr[2]
  end

  # Find first occurance of a letter
  def self.find_pos(str, letter, n=1)
    #TODO: Handle nil string?
    if n >= 0
      pos = -1
      for i in 1..n do
        pos = str.index(letter, pos+1)
      end
    else
      pos = str.size
      for i in 1..-n do
        pos = str.rindex(letter, pos-1)
      end
    end
    pos
  end

  # Move letter at pos1 to pos2
  def self.move(str, pos1, pos2)
    #TODO: out of bounds check?
    letter = str[pos1]
    s = self.delete(str, pos1)
    s = self.insert(s, pos2, letter)
  end
  
  def self.change(str, pos, letter)
    #TODO: out of bounds check?
    str[pos] = letter
    str
  end

  def self.increment(str, pos)
    #TODO: out of bounds check?
    str[pos] = str[pos].next
    str
  end

  # Find the first instance of the latest letter in the alphabet in the string
  def self.find_latest(str) 
    biggest_ord = 0
    return_pos = 0
    str.each_char.with_index do |c, pos|
      if c.ord > biggest_ord
        biggest_ord = c.ord 
        return_pos = pos
      end
    end
    return_pos
  end
  
end
