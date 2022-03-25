require_relative '../person'
require_relative '../nameable'

describe Person do
  context 'Testing the Person class' do
    person = Person.new(20, 'student1', parent_permission: true)

    it 'has the class Person' do
      expect(person.class) == Person
    end

    it 'should have the right name, age and permission' do
      expect(person.age).to eq 20
      expect(person.name).to eq 'student1'
      expect(person.parent_permission).to eq true
    end
  end
end
