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
  
end
