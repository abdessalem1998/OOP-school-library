require './save_retrive'

class CreateRental
  include SaveRetrive

  def initialize(rentals, books, people)
    @rentals = rentals
    @books = books
    @people = people
  end

  def create
    puts 'Select a book from the following list by its number:'
    puts(@books.each_with_index.map { |book, index| "#{index + 1}) Title: #{book.title} Author: #{book.author}" })
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by its number:'
    puts(@people.each_with_index.map do |person, index|
           "#{index + 1}) #{person.class.name} name: #{person.name} ID: #{person.id} age: #{person.age}"
         end)
    person_index = gets.chomp.to_i

    print 'Date [YYYY/MM/DD]: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index - 1], @people[person_index - 1])

    @rentals << rental
    save
    puts 'Rental created successfully!'
  end
end
