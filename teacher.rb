require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, name, id = rand(1..1000), age = nil, parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
