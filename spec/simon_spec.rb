$LOAD_PATH.unshift File.expand_path('../../lib/', __FILE__)

require 'pry'
require 'simon.rb'

describe SimonSays do

  it 'switches two characters' do
    expect(SimonSays::switch('ABCD', 0,1)).to eq 'BACD'
  end

  it 'switches counting from the right if position is negative' do
    expect(SimonSays::switch('ABCD', 0,-2)).to eq 'CBAD'
  end

  it 'deletes a letter based on zero-based position' do
    expect(SimonSays::delete('ABCD', 0)).to eq 'BCD'
    expect(SimonSays::delete('ABCD', 1)).to eq 'ACD'
    expect(SimonSays::delete('ABCD', 2)).to eq 'ABD'
    expect(SimonSays::delete('ABCD', 3)).to eq 'ABC'
  end

  it 'finds the position of the rightmost letter' do
    expect(SimonSays::rightmost_pos('ABCD')).to eq 3
  end
  
  it 'inserts a letter at the specified position' do
    expect(SimonSays::insert('ABCD', 0, 'X')).to eq 'XABCD'
    expect(SimonSays::insert('ABCD', 1, 'X')).to eq 'AXBCD'
    expect(SimonSays::insert('ABCD', 2, 'X')).to eq 'ABXCD'
    expect(SimonSays::insert('ABCD', 3, 'X')).to eq 'ABCXD'
    expect(SimonSays::insert('ABCD', 4, 'X')).to eq 'ABCDX'
  end

  it 'finds the first position of a letter' do
    expect(SimonSays::find_pos('ABCD', search: 'A')).to eq 0
    expect(SimonSays::find_pos('ABCD', search: 'B')).to eq 1
    expect(SimonSays::find_pos('ABCD', search: 'C')).to eq 2
    expect(SimonSays::find_pos('ABCD', search: 'D')).to eq 3
  end

  it 'moves a letter from one position to another' do
    expect(SimonSays::move('ABCD', 1, 0)).to eq 'BACD'
    expect(SimonSays::move('ABCD', 3, 1)).to eq 'ADBC'
    expect(SimonSays::move('ABCD', 0, 1)).to eq 'BACD'
    expect(SimonSays::move('ABCD', 2, 3)).to eq 'ABDC'
  end

  it 'moves with negative positions' do
    expect(SimonSays::move('ABCD', -4, -1)).to eq 'BCAD'
  end
  
  it 'finds the nth position of a letter from the left' do
    expect(SimonSays::find_pos('ABCAD', search: 'A', instance: 2)).to eq 3
    expect(SimonSays::find_pos('ABCAD', search: 'A', instance: 1)).to eq 0
    expect(SimonSays::find_pos('ABCAD', search: 'C', instance: 1)).to eq 2
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: 1)).to eq 0
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: 2)).to eq 1
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: 3)).to eq 2
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: 4)).to eq 3
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: 5)).to eq 4
  end

  it 'finds the nth position of a letter from the right' do
    expect(SimonSays::find_pos('ABCAD', search: 'A', instance: -2)).to eq 0
    expect(SimonSays::find_pos('ABCAD', search: 'A', instance: -1)).to eq 3
    expect(SimonSays::find_pos('ABCAD', search: 'C', instance: -1)).to eq 2
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: -1)).to eq 4
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: -2)).to eq 3
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: -3)).to eq 2
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: -4)).to eq 1
    expect(SimonSays::find_pos('DDDDD', search: 'D', instance: -5)).to eq 0
  end

  it 'finds the nth vowel' do
    expect(SimonSays::find_pos('ABCDEFGHI', search: SimonSays::VOWEL, instance: 1)).to eq 0
    expect(SimonSays::find_pos('ABCDEFGHI', search: SimonSays::VOWEL, instance: 2)).to eq 4
    expect(SimonSays::find_pos('ABCDEFGHI', search: SimonSays::VOWEL, instance: 3)).to eq 8
    expect(SimonSays::find_pos('ABCDEFGHI', search: SimonSays::VOWEL, instance: -1)).to eq 8
    expect(SimonSays::find_pos('ABCDEFGHI', search: SimonSays::VOWEL, instance: -2)).to eq 4
    expect(SimonSays::find_pos('ABCDEFGHI', search: SimonSays::VOWEL, instance: -3)).to eq 0
  end

  it 'finds the nth consonant' do
    expect(SimonSays::find_pos('ABCD', search: SimonSays::CONS, instance: 1)).to eq 1
    expect(SimonSays::find_pos('ABCD', search: SimonSays::CONS, instance: 2)).to eq 2
    expect(SimonSays::find_pos('ABCD', search: SimonSays::CONS, instance: 3)).to eq 3
    expect(SimonSays::find_pos('ABCD', search: SimonSays::CONS, instance: -1)).to eq 3
    expect(SimonSays::find_pos('ABCD', search: SimonSays::CONS, instance: -2)).to eq 2
    expect(SimonSays::find_pos('ABCD', search: SimonSays::CONS, instance: -3)).to eq 1
  end

  it 'changes a letter at a specified position' do
    expect(SimonSays::change('ABCD', 1, 'X')).to eq 'AXCD'
    expect(SimonSays::change('ABCD', 3, 'Y')).to eq 'ABCY'
    expect(SimonSays::change('ABCD', 0, 'G')).to eq 'GBCD'
    expect(SimonSays::change('ABCD', 2, 'A')).to eq 'ABAD'
  end
  
  it 'increments a letter to the next letter in the alphabet at a specified position' do
    expect(SimonSays::increment('ABCD', 0)).to eq 'BBCD'
    expect(SimonSays::increment('ABCD', 1)).to eq 'ACCD'
    expect(SimonSays::increment('ABCD', 2)).to eq 'ABDD'
    expect(SimonSays::increment('ABCD', 3)).to eq 'ABCE'
  end

  it 'finds the position of the latest letter in the alphabet' do
    expect(SimonSays::find_latest('ABCD')).to eq 3
    expect(SimonSays::find_latest('AFBCD')).to eq 1
    expect(SimonSays::find_latest('ABDCD')).to eq 2
  end

  it 'finds the first instance of two consecutive vowels' do
    expect(SimonSays::find_two_consec_vowels('AEBCD')).to eq 0
    expect(SimonSays::find_two_consec_vowels('ABIECD')).to eq 2
    expect(SimonSays::find_two_consec_vowels('ABICDUU')).to eq 5
    expect(SimonSays::find_two_consec_vowels('ABICDUU')).to eq 5
  end

  it "does the puzzle" do
    s = SimonSays::switch("THEPERFUMEFACTORY", SimonSays::LEFTMOST, -9)
    s = SimonSays::delete(s, SimonSays::rightmost_pos(s))
    s = SimonSays::insert(s, 8, 'O')
    s = SimonSays::move(s, SimonSays::find_pos(s, search: 'A'), 1)
    s = SimonSays::delete(s, SimonSays::find_pos(s, search: 'E', instance: -2))
    s = SimonSays::increment(s, SimonSays::rightmost_pos(s))
    s = SimonSays::switch(s, -7, -8)
    s = SimonSays::delete(s, SimonSays::find_latest(s))
    s = SimonSays::move(s, 
                        SimonSays::find_pos(s, search: SimonSays::VOWEL, instance: -2), 
                        SimonSays::find_pos(s, search: 'C'))
    s = SimonSays::change(s, SimonSays::find_pos(s, search: SimonSays::CONS, instance: 2), 'D')
    rightmost_vowel = SimonSays::find_pos(s, search: SimonSays::VOWEL, instance: -1)
    s = SimonSays::move(s, rightmost_vowel, rightmost_vowel-7)
    s = SimonSays::insert(s, 4, 'A')
    s = SimonSays::delete(s, SimonSays::find_pos(s, search: SimonSays::CONS, instance: 5))
    s = SimonSays::increment(s, SimonSays::find_pos(s, search: SimonSays::CONS, instance: 4))
    s = SimonSays::insert(s, SimonSays::find_pos(s, search: SimonSays::VOWEL, instance: -1)+1, 'N')
    s = SimonSays::delete(s, 
                          SimonSays::find_two_consec_vowels(s)+2)
    s = SimonSays::move(s, SimonSays::find_pos(s, search: SimonSays::CONS, instance: 3), -5)
    s = SimonSays::insert(s, 5, 'L')
    puts "\n" + s
  end
end
