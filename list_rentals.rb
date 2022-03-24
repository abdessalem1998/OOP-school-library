class ListRentals
  def initialize(rentals, people)
    @rentals = rentals
    @people = people
  end

  def display
    print('Id of the person: ')
    id = gets.chomp.to_i
    person = @rentals.filter { |p| p.person.id == id }.first
    puts("Date: #{person.date}, Book: #{person.book.title}, by #{person.book.author}")
  end
end
