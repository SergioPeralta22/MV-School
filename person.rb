require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(id = rand(1..1000), name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rental << rental
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
