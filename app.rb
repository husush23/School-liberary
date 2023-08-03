require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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
    # classroom = gets.chomp
    student = Student.new(age: age, name: name, parent_permission: parent_permission, classroom: 'classroom')
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
    teacher = Teacher.new(age: age, name: name, specialization: specialization)
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
    book = Book.new(title, author)
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
    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(rental)
    puts 'Rental created successfully.'
  end

  def rental_list
    return if @rentals.empty?

    print 'ID of person: '
    person_id = gets.chomp.to_i
    selected_rentals = @rentals.select { |rental| rental.person.id == person_id }
    if selected_rentals.empty?
      puts 'No rentals found for the given person ID.'
    else
      puts 'Rentals List:'
      selected_rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def choose_num(number)
    case number
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_list
    when 7
      puts 'Thank you for using this app.'
      exit
    else
      puts 'Invalid option! Please choose a valid option.'
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
