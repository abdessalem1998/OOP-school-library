class ListPeople
  def initialize(people)
    @people = people
  end

  def list_people
    puts 'No people found' if @people.empty?
    puts(@people.map { |person| "#{person.class.name} Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" })
  end
end
