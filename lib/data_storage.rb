require 'json'

class DataStorage
  DATA_DIR = 'data'.freeze

  def self.save_books(books)
    save_data('books.json', books) { |book| { title: book.title, author: book.author } }
  end

  def self.load_books(book_factory)
    load_data('books.json') do |data|
      book_factory.create_book(data['title'], data['author'])
    end
  end

  def self.save_people(people)
    save_data('people.json', people) do |person|
      {
        class_name: person.class.to_s,
        id: person.id,
        name: person.name,
        age: person.age
      }
    end
  end

  def self.load_people(person_factory)
    load_data('people.json') do |data|
      if data['class_name'] == 'Student'
        person_factory.create_student(data['id'], data['name'], data['age'], true, 'xx')
      else
        person_factory.create_teacher(data['id'], data['name'], data['age'], 'Specialization')
      end
    end
  end

  def self.save_rentals(rentals)
    save_data('rentals.json', rentals) do |rental|
      {
        date: rental.date,
        person_id: rental.person.id,
        book_title: rental.book.title
      }
    end
  end

  def self.load_rentals(people, books, rental_manager)
    load_data('rentals.json') do |data|
      person = people.find { |p| p.id.to_s == data['person_id'].to_s }
      book = books.find { |b| b.title == data['book_title'] }
      rental_manager.create_rental(data['date'], person, book) if person && book
    end
  end

  def self.save_data(file_name, data)
    FileUtils.mkdir_p(DATA_DIR)
    file_path = File.join(DATA_DIR, file_name)

    File.open(file_path, 'w') do |file|
      data.each { |item| file.puts(JSON.generate(yield(item))) }
    end
  end

  def self.load_data(file_name)
    file_path = File.join(DATA_DIR, file_name)
    return [] unless File.exist?(file_path)

    File.foreach(file_path).map { |line| JSON.parse(line) }
  end
end
