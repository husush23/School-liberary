require_relative 'book'

class BookFactory
    def create_book(title, author)
      Book.new(title, author)
    end
  end