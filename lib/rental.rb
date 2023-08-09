class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book[:rental] ||= []
    book[:rental] << self

    @person = person
    person[:rental] ||= []
    person[:rental] << self
  end

  def to_hash
    {
      date: @date,
      book: @book.to_hash,
      person: @person.to_hash
    }
  end
end
