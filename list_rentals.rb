class ListRentals
  def initialize(rentals, people)
    @rentals = rentals
    @people = people
  end

  def display
    print('Id of the person: ')
    id = gets.chomp.to_i
    person = @people.filter { |p| p.id == id }.first
    puts(person.rentals.map { |rental| "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}" })
  end
end
