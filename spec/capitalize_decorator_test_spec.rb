require './capitalize_decorator'
require 'rspec'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'A name') }
  subject { described_class.new(nameable) }

  describe 'Testing the Capitalize decorator' do
    it 'returns the correct name of the nameable object in uppercase' do
      expect(subject.correct_name).to eq('A NAME')
    end
  end
end
