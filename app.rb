class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'list_books'
  end

  def list_people
    puts 'list_people'
  end

  def create_person
    puts 'create_person'
  end

  def create_book
    puts 'create_person'
  end

  def create_rental
    puts 'create_person'
  end

  def list_rentals
    puts 'list_rentals'
  end

  def print_start_message
    puts 'Please choose an option:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person'
    puts '7 - Exit'
  end

  def start
    puts "Welcome to our school library app!"
    loop do
        puts "Please choose an option:"
        puts "1 - List all books"
        puts "2 - List all people"
        puts "3 - Create a person"
        puts "4 - Create a book"
        puts "5 - Create a rental"
        puts "6 - List all rentals for a given person"
        puts "7 - Exit"

    option = gets.chomp.to_i

    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts "Okay. Bye"
      break
    end
    end
  end

end

app = App.new
app.start
