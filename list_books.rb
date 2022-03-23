class ListBooks
  def initialize(books)
    @books = books
  end

  def display
    if @books.length.zero?
      puts "\nThere are no books in the library. You can create a book from the main menu."
    else
      puts "\nHere are all the books in the library:"
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Book's title: #{book.title}, Book's author: #{book.author}"
      end
    end
  end
end
