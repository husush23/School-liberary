require_relative 'person_factory'
require_relative 'person'

require_relative 'book_factory'
require_relative 'rental_manager'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @person_factory = PersonFactory.new
    @book_factory = BookFactory.new
    @rental_manager = RentalManager.new
  end

  def display_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'Books List:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts 'People List:'
      @people.each_with_index do |person, index|
        puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_student
    puts 'Creating a student...'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = 'xx'
    student = @person_factory.create_student(age, name, parent_permission, classroom)
    @people.push(student)
    puts 'Student created successfully.'
  end

  def create_teacher
    puts 'Creating a teacher...'
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = @person_factory.create_teacher(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher created successfully.'
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Enter the number]: '
    num_person = gets.chomp.to_i
    case num_person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option! Please choose a valid option.'
    end
  end

  def create_book
    puts 'Creating a book...'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = @book_factory.create_book(title, author)
    @books.push(book)
    puts 'Book created successfully.'
  end

  def create_rental
    return if @books.empty? || @people.empty?

    puts 'Select a book from the following list by number:'
    list_all_books
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number:'
    list_all_people
    person_index = gets.chomp.to_i - 1
    print 'Date (DD-MM-YYYY): '
    date = gets.chomp

    @rental_manager.create_rental(date, @people[person_index], @books[book_index])
  end

  def rental_list
    print 'ID of person: '
    person_id = gets.chomp.to_i
    rentals = @rental_manager.find_rentals_for_person(person_id)

    if rentals.empty?
      puts 'No rentals found for the given person ID.'
    else
      puts 'Rentals List:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def choose_num(number)
    case number
    when 1 then list_all_books
    when 2 then list_all_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then rental_list
    else
      puts 'Thank you for using this app.'
      exit
    end
  end

  def run
    loop do
      display_options
      number = gets.chomp.to_i
      choose_num(number)
      puts ''
    end
  end
end


app = App.new
app.run
