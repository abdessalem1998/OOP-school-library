require_relative '../student'

describe Student do
  context 'Testing the Student class' do
    student = Student.new(18, 'class', false)

    it 'has the class of Student' do
      expect(student.instance_of?(Student)) == true
    end

    it 'should have the right name - Unknown, age - 18 and permission - false' do
      expect(student.age).to eq 18
      expect(student.name).to eq 'Unknown'
      expect(student.parent_permission).to eq false
    end
  end
end
