class InputClass
  def input_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    gets.chomp.to_i
  end

  def input_age
    print 'Age: '
    gets.chomp.to_i
  end

  def input_name
    print 'Name: '
    gets.chomp
  end

  def input_permission
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    if permission.downcase == 'y'
      true
    elsif permission.downcase == 'n'
      false
    else
      wrong('word')
    end
  end

  def input_class_lable
    print 'class-lable: '
    gets.chomp
  end

  def specialization
    print 'Specialization: '
    gets.chomp
  end

  def input_title
    print 'Title : '
    gets.chomp
  end

  def input_author
    print 'Author : '
    gets.chomp
  end

  def book_select(books)
    puts 'Select a book from the following list by number'

    books.each_with_index { |book, index| puts "#{index}) Title:  \"#{book[:title]}\"    Author\" #{book[:author]}\"" }
    gets.chomp.to_i
  end

  def person_select(people)
    puts "\nSelect a person from the following list by number (not id)"

    people.each_with_index do |person, index|
      print "#{index}) Name: #{person[:name]}  Age: #{person[:age]} "
      print " - #{person[:person_type] == 1 ? 'Student' : 'Teacher'} \n"
    end
    gets.chomp.to_i
  end

  def date_rental
    print "\n Date(DD-MM-YYYY): "
    gets.chomp
  end

  def rental_select(rentals)
    print 'ID of person: '
    person_id = gets.chomp.to_i
    rentals.select { |rental| rental[:person_id] == person_id }
  end
end
