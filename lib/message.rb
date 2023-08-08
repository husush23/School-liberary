class Message
  def success_message(value)
    puts "#{value} created successfully"
  end

  def info_message(text)
    puts "Please create a #{text} at first."
  end

  def error_message(text)
    puts "you write  the wronge #{text}"
  end

  def error_rental(books)
    if books.empty?
      puts 'The books are empty ❌'
    else
      puts 'The people are not empty ❌'
    end
  end
end
