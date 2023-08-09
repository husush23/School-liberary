class Book
  attr_accessor :title, :author, :rental, :id

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def to_hash
    {
      id: @id,
      title: @title,
      author: @author
    }
  end
end
