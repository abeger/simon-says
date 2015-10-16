module SimonSays

  LEFTMOST = 0

  # Switch letters at pos1 and pos2
  def self.switch(str, pos1, pos2) 
    a = str[pos1]
    str[pos1] = str[pos2]
    str[pos2] = a
    str
  end

  # Remove letter at pos
  def self.delete(str, pos) 
    #TODO: Handle position outside range?
    s = ''
    if pos > 0
      s = str.slice(0..(pos-1))
    end
    if pos < (str.size - 1)
      s = s.concat(str.slice(pos+1..str.size-1))
    end
    s
  end

  # Return the index of the rightmost character
  def self.rightmost_pos(str)
    #TODO: empty check?
    str.size - 1
  end

  # Insert letter at specified position
  def self.insert(str, pos, letter)
    s = ''
    if pos > 0
      s = str.slice(0..(pos-1))
    end
    s = s.concat(letter)
    if pos < str.size
      s = s.concat(str.slice(pos..str.size-1))
    end
    s
  end

  # Find first occurance of a letter
  def self.find_pos(str, letter)
    #TODO: Handle nil?
    str.index(letter)
  end

  # Move letter at pos1 to pos2
  def self.move(str, pos1, pos2)
    #TODO: out of bounds check?
    letter = str[pos1]
    s = self.delete(str, pos1)
    s = self.insert(s, pos2, letter)
  end
  
end
