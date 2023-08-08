require 'json'
require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'input_class'
require_relative 'message'
require_relative 'preserve'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @message = Message.new
    @input_data = InputClass.new
  end

  def create_student
    preserve = Preserve.new
    age = @input_data.input_age
    name = @input_data.input_name
    permission = @input_data.input_permission
    class_lable = @input_data.input_class_lable
    person = Student.new(class_lable, age, name, parent_permission: permission)
    preserve.create_student_json(person, 1)
  end

  def create_teacher
    preserve = Preserve.new
    age = @input_data.input_age
    name = @input_data.input_name
    specialization = @input_data.specialization
    person = Teacher.new(specialization, age, name)
    preserve.create_teacher_json(person, 2)
  end

  def check_res_person
    res = read_file('people.json')
    if !res.nil? && res.class != Array
      @people.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @people = res
    end
  end

  def create_person
    num_person = @input_data.input_person
    new_person = nil
    if num_person == 1
      new_person = create_student
    elsif num_person == 2
      new_person = create_teacher
    else
      @message.error_message('number')
    end
    check_res_person
    @people.push(new_person)
    write_file('people.json', @people)
    @message.success_message('Person')
  end

  def create_book
    title = @input_data.input_title
    author = @input_data.input_author
    res = read_file('books.json')
    if !res.nil? && res.class != Array
      @books.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @books = res
    end
    @books.push(Book.new(title, author))
    write_file('books.json', @books)
    @message.success_message('Book')
  end

  def read_file(file_name)
    # Handle if file does not exist
    if File.exist?(file_name)
      file = File.read(file_name)
      JSON.parse(file, symbolize_names: true)
    else
      []
    end
  end

  def book_list
    @books = read_file('books.json')

    @message.info_message('book') if @books.empty?

    @books.each { |book| puts "Title:  \"#{book[:title]}\"    Author\" #{book[:author]}\"" }
  end

  def people_list
    @people = read_file('people.json')
    @message.info_message('person') if @people.empty?
    @people.each do |person|
      puts "[#{person[:person_type] == 1 ? 'Student' : 'Teacher'}] Name: #{person[:name]}, Age: #{person[:age]}"
    end
  end

  def create_rental_object(date, book, person)
    {
      date: date,
      book_id: book[:id],
      person_id: person[:id]
    }
  end

  def create_rental
    @books = read_file('books.json')
    @people = read_file('people.json')
    return @message.error_rental(@books) if @books.empty? || @people.empty?

    book_index = @input_data.book_select(@books)
    book = @books[book_index]
    person_index = @input_data.person_select(@people)
    p = @people[person_index]
    date = @input_data.date_rental
    rental_one = create_rental_object(date, book, p)

    res = read_file('rentals.json')
    if !res.nil? && res.class != Array
      @rentals.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @rentals = res
    end

    @rentals.push(rental_one)
    write_file('rentals.json', @rentals)
    @message.success_message('Rental')
  end

  def rental_list
    @books = read_file('books.json')
    @people = read_file('people.json')
    @rentals = read_file('rentals.json')
    return @message.error_rental(@books) if @rentals.empty?

    selected_rental = @input_data.rental_select(@rentals)
    puts 'Rantals'
    selected_rental.each do |rental|
      book = @books.find { |item| item[:id] == rental[:book_id] }
      persons = @people.find { |person| person[:id] == rental[:person_id] }
      puts "#{rental[:date]} - #{book[:title]} - #{persons[:name]}" unless book.nil? || persons.nil?
    end
  end

  def write_file(file, content)
    data = content.map(&:to_hash)
    json = JSON.pretty_generate(data)
    File.write(file, json)
  end
end
