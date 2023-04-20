require './trimmer_decorator'
require 'rspec'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'A very long name') }
  subject { described_class.new(nameable) }

  describe 'Testing if the method works as expected' do
    it 'returns the first 10 characters of the correct name' do
      expect(subject.correct_name).to eq('A very lon')
    end
  end
end
