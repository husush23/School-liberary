require_relative "../lib/book"

describe Book do
    let (:title){"Boko1"}
    let (:author){"Auhto1"}
    let (:book){Book.new(title, author)}
    describe('Instantiate the class') do
        it('Book title should same as one given') do 
            expect(book.title).to eq(title)
        end
        it('Book author should same as one given') do 
            expect(book.author).to eq(author)
        end
    end
end