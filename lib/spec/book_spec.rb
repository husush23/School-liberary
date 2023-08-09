# Assuming your Book class is defined in book.rb
require_relative 'book'

describe Book do
  let(:book) { Book.new('Title', 'Author', 2023) }

  context '#title' do
    it 'returns the book title' do
      expect(book.title).to eq('Title')
    end
  end

  context '#author' do
    it 'returns the book author' do
      expect(book.author).to eq('Author')
    end
  end

  context '#publication_year' do
    it 'returns the publication year' do
      expect(book.publication_year).to eq(2023)
    end
  end
end
