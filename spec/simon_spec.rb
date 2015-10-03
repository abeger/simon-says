$LOAD_PATH.unshift File.expand_path('../../lib/', __FILE__)

require 'simon.rb'

describe SimonSays do

  it "initializes the string" do
    s = SimonSays.new("ABCD")
    expect(s.text).to eq 'ABCD'
  end

  it "removes whitespace" do
    s = SimonSays.new("A B C D")
    expect(s.text).to eq 'ABCD'
  end

  it 'switches two characters' do
    s = SimonSays.new("ABCD")
    s.switch(0,1)
    expect(s.text).to eq ('BACD')
  end

  it 'switches counting from the right if position is negative' do
    s = SimonSays.new("ABCD")
    s.switch(0,-2)
    expect(s.text).to eq ('CBAD')
  end

  it "does the puzzle" do
    s = SimonSays.new("THE PERFUME FACTORY")
    s.switch(SimonSays::LEFTMOST, -9)
  end
end
