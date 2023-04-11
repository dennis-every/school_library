class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def can_use_services?
    of_age? && @parent_permission == true
  end

  private

  def of_age?
    @age >= 18
  end
end
