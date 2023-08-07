require_relative 'rental'

class RentalManager
  def initialize
    @rentals = []
  end

  def create_rental(date, person, book)
    rental = Rental.new(date, person, book)
    @rentals.push(rental)
    puts 'Rental created successfully.'
  end

  def find_rentals_for_person(person_id)
    @rentals.select { |rental| rental.person.id == person_id }
  end
end
