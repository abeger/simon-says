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
    expect(SimonSays::delete('ABCD', 2)).to eq 'ABD'
  end

  it 'deletes the rightmost letter without issue' do
    expect(SimonSays::delete('ABCD', 3)).to eq 'ABC'
  end

  it 'finds the position of the rightmost letter' do
    expect(SimonSays::rightmost_pos('ABCD')).to eq 3
  end
  
  it "does the puzzle" do
    s = SimonSays::switch("THEPERFUMEFACTORY", SimonSays::LEFTMOST, -9)
    SimonSays::delete(s, SimonSays::rightmost_pos(s))
  end
end
