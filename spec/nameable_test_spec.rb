require './nameable'

describe Nameable do
  it 'expect to show NotImplementedError' do
    n = Nameable.new
    expect { n.correct_name }.to raise_error(NotImplementedError)
  end
end
