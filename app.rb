require './helper'
require './student'
require './teacher'
require './book'
require './rental'
require './list_books'
require './create_person'
require './create_books'
require './list_people'
require './create_rental'
require './list_rentals'
require './save_retrive'

require 'json'

class App

  include SaveRetrive

  def initialize
    @people = retrieve_people
    @books = retrieve_books
    @rentals = retrieve_rentals
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
      CreateRental.new(@rentals, @books, @people).create
    when 6
      ListRentals.new(@rentals, @people).display
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
