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

  def start
    puts 'start'
  end

end

app = App.new
app.start
