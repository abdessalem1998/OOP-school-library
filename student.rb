require_relative './person'

class Student < Person
  attr_reader :classroom, :type

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, name, parent_permission:
    parent_permission)
    @classroom = classroom
    @type = 'Student'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
