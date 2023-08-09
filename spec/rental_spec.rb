require_relative '../lib/rental'

describe Rental do
    let(:date) { '2023-08-09' }
  let(:book) { { id: 1, title: 'Sample Title', author: 'Sample Author', rental: [] } }
  let(:person) { { id: 1, name: 'John Doe', rental: [] } }
  let(:rental) { Rental.new(date, book, person) }

  describe '#Rental' do
    it 'Displays the corerct data' do
      expect(rental.date).to eq(date)

        end
    it 'Returns the correct book' do
      expect(rental.book).to eq(book)
        end
    it 'Displays the correct person made the rental' do
      expect(rental.person).to eq(person)
        end
    end
    describe '#to_hash' do
        it 'returns rental data as a hash' do
          expected_hash = {
            date: date,
            book: book,
            person: person
          }
          expect(rental.to_hash).to eq(expected_hash)
        end
      end
end