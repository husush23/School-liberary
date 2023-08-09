class Message
  def success_message(value)
    puts "#{value} created successfully"
  end

  def info_message(text)
    puts "Please create a #{text} at first."
  end

  def error_message(text)
    puts "you write  a wronge #{text}"
  end

  def error_rental(books)
    if books.empty?
      puts 'No books are saved'
    else
      puts 'No people in record'
    end
  end
end
