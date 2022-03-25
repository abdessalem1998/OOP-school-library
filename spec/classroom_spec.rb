require_relative '../classroom'

describe Classroom do
  context 'Testing the Classroom class' do
    classroom = Classroom.new('math')

    it 'has the class classroom' do
      expect(classroom.class) == Classroom
    end

    it 'should have the right label' do
      expect(classroom.label).to eq 'math'
    end
  end
end
