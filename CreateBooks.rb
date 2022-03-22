class CreateBooks
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
        puts "Book #{title} created successfully.\n"
    end
end
