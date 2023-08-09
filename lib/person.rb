require_relative 'nameable'
require_relative 'base_decrator'
require_relative 'capitalize_decrator'
require_relative 'trimmer_decrator'

class Person < Nameable
  def initialize(age, name = nil, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name || 'unknown'
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id

  attr_accessor :name, :age, :rental, :parent_permission

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
