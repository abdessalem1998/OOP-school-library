require './save_retrive'

class CreateBooks
  include SaveRetrive

  def initialize(books)
    @books = books
  end

  def create
    puts "\nCreate a new book"
    print "\nEnter book's title: "
    title = gets.chomp
    print "Enter book's author: "
    author = gets.chomp
    @books.push(Book.new(title, author))
    save
    puts "Book #{title} created successfully.\n"
  end
end
