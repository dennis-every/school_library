require 'rspec'
require './person'

describe Person do
  describe '#initialize' do
    it 'creates a new person with the given age and name' do
      person = Person.new(30, 'Alice')
      expect(person.age).to eq(30)
      expect(person.name).to eq('Alice')
    end

    it 'sets the parent_permission attribute to true by default' do
      person = Person.new(30, 'Alice')
      expect(person.instance_variable_get(:@parent_permission)).to be true
    end
  end

  describe '.all' do
    before(:each) do
      Person.class_variable_set(:@@all, [])
    end

    it 'returns an array of all people' do
      person1 = Person.new(30, 'Alice')
      person2 = Person.new(40, 'Bob')
      expect(Person.all).to eq([person1, person2])
    end
  end

  describe '.find_by_id' do
    before(:each) do
      Person.class_variable_set(:@@all, [])
    end

    it 'returns the person with the given id' do
      person1 = Person.new(30, 'Alice')
      expect(Person.find_by_id(person1.id)).to eq(person1)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(30, 'Alice')
      expect(person.can_use_services?).to be true
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(15, 'Charlie', parent_permission: true)
      expect(person.can_use_services?).to be true
    end

    it 'returns false if the person is not of age and does not have parent permission' do
      person = Person.new(15, 'Charlie', parent_permission: false)
      expect(person.can_use_services?).to be false
    end
  end
end
