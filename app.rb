require './helper'
require './student'
require './teacher'
require './book'
require './rental'
require './ListBooks'
require './CreatePerson'
require './CreateBooks'
require './ListPeople'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def create_rental
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
    puts 'Rental created successfully!'
  end

  def list_rentals
    print('Id of the person: ')
    id = gets.chomp.to_i
    person = @people.filter { |p| p.id == id }.first
    puts(person.rentals.map { |rental| "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}" })
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

  def execute(option)
    case option
    when 1
      ListBooks.new(@books).display
    when 2
      ListPeople.new(@people).list_people
    when 3
      CreatePerson.new(@people).create_person
    when 4
      CreateBooks.new(@books).create
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def start
    puts 'Welcome to our school library app!'
    loop do
      print_start_message

      option = gets.chomp.to_i

      if option == 7
        puts 'thanks!!'
        break
      end

      execute(option)
    end
  end
end
