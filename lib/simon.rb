module SimonSays

  LEFTMOST = 0
  VOWEL = 1
  CONS = 4

  # Switch letters at pos1 and pos2
  def self.switch(str, pos1, pos2) 
    a = str[pos1]
    str[pos1] = str[pos2]
    str[pos2] = a
    str
  end

  # like String::partition, but by index
  def self.index_partition(str, index)
    if index >= 0
      a = str[0, index] || ''
      b = str[index] || ''
      c = str[index+1, str.size-index] || ''
    else 
      a = str[0, str.size+index] || ''
      b = str[index] || ''
      c = str[str.size+index+1, -index] || ''
    end
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
  def self.find_pos(str, args={})
    instance = args[:instance] || 1
    search_arg = args[:search] || nil
    case search_arg
    when VOWEL
      search = /[AEIOU]/
    when CONS
      search = /[^AEIOU]/
    else
      search = search_arg
    end
      
    #TODO: Handle nil string?
    if instance >= 0
      pos = -1
      for i in 1..instance do
        pos = str.index(search, pos+1)
      end
    else
      pos = str.size
      for i in 1..-instance do
        pos = str.rindex(search, pos-1)
      end
    end
    pos
  end

  # Move letter at pos1 to pos2
  def self.move(str, pos1, pos2)
    #TODO: Move has a problem in that it doesn't move relative to the original word
    # Basically, if I say "Move the B in ABCD to the right of the C", I would expect to 
    # move to the position of C plus 1. BUT, because of the delete, what I actually 
    # want is to move it to the current position of C: once the B is deleted, C moves up a 
    # spot, so the position of C to the right is actually the original position of C.
    # I can either intuit this in the calling method (current implementation) or figure out
    # how to disambiguate this method
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

  def self.find_two_consec_vowels(str)
    str.index(/[AEIOU]{2}/)
  end
  
end
