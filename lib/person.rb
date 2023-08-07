require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trim_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age:, name: 'unknown', parent_permission: true)
    super()
    @id = rand(1..200)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(name: 'Maximilianus', age: 22)
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
