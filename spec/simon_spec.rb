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
    expect(SimonSays::find_pos('ABCD', 'A')).to eq 0
    expect(SimonSays::find_pos('ABCD', 'B')).to eq 1
    expect(SimonSays::find_pos('ABCD', 'C')).to eq 2
    expect(SimonSays::find_pos('ABCD', 'D')).to eq 3
  end

  it 'moves a letter from one position to another' do
    expect(SimonSays::move('ABCD', 1, 0)).to eq 'BACD'
    expect(SimonSays::move('ABCD', 3, 1)).to eq 'ADBC'
    expect(SimonSays::move('ABCD', 0, 1)).to eq 'BACD'
    expect(SimonSays::move('ABCD', 2, 3)).to eq 'ABDC'
  end
  
  it 'finds the nth position of a letter from the left' do
    expect(SimonSays::find_pos('ABCAD', 'A', 2)).to eq 3
    expect(SimonSays::find_pos('ABCAD', 'A', 1)).to eq 0
    expect(SimonSays::find_pos('ABCAD', 'C', 1)).to eq 2
    expect(SimonSays::find_pos('DDDDD', 'D', 1)).to eq 0
    expect(SimonSays::find_pos('DDDDD', 'D', 2)).to eq 1
    expect(SimonSays::find_pos('DDDDD', 'D', 3)).to eq 2
    expect(SimonSays::find_pos('DDDDD', 'D', 4)).to eq 3
    expect(SimonSays::find_pos('DDDDD', 'D', 5)).to eq 4
  end

  it 'finds the nth position of a letter from the right' do
    expect(SimonSays::find_pos('ABCAD', 'A', -2)).to eq 0
    expect(SimonSays::find_pos('ABCAD', 'A', -1)).to eq 3
    expect(SimonSays::find_pos('ABCAD', 'C', -1)).to eq 2
    expect(SimonSays::find_pos('DDDDD', 'D', -1)).to eq 4
    expect(SimonSays::find_pos('DDDDD', 'D', -2)).to eq 3
    expect(SimonSays::find_pos('DDDDD', 'D', -3)).to eq 2
    expect(SimonSays::find_pos('DDDDD', 'D', -4)).to eq 1
    expect(SimonSays::find_pos('DDDDD', 'D', -5)).to eq 0
  end

  it "does the puzzle" do
    s = SimonSays::switch("THEPERFUMEFACTORY", SimonSays::LEFTMOST, -9)
    s = SimonSays::delete(s, SimonSays::rightmost_pos(s))
    s = SimonSays::insert(s, 8, 'O')
    s = SimonSays::move(s, SimonSays::find_pos(s, 'A'), 1)
    s = SimonSays::delete(s, SimonSays::find_pos(s, 'E', -2))
  end
end
