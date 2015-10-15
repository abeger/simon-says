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

  it "does the puzzle" do
    s = SimonSays::switch("THEPERFUMEFACTORY", SimonSays::LEFTMOST, -9)
    s = SimonSays::delete(s, SimonSays::rightmost_pos(s))
    s = SimonSays::insert(s, 9, 'O')
  end
end
