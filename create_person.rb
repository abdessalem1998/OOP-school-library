require './save_retrive'

class CreatePerson
  include SaveRetrive

  def initialize(rentals, books, people)
    @rentals = rentals
    @books = books
    @people = people
  end

  def create_person
    option = get_promt('Do you want to create a new student (1) or a new teacher? (2) [1/2]: ').to_i

    unless [1, 2].include?(option)
      puts 'Invalid selection'
      return
    end

    age = get_promt('Age: ')
    name = get_promt('Name: ')

    case option
    when 1
      permission = get_promt('Has parent permission? [y/n]:') == 'y'
      student = Student.new(name, 'class', permission, age)
      @people << student
    when 2
      specialization = get_promt('Specialization: ')
      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    end
    save
    puts "Person #{name} created successfully!"
  end
end
