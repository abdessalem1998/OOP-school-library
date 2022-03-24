require_relative '../teacher'
require_relative '../book'
require_relative '../rental'

describe Rental do
  context 'When providing a book and a person' do
    book = Book.new('book 1', 'author 1')
    teacher = Teacher.new(50, 'Math', 'teacher1')
    rental = Rental.new('2020-12-12', book, teacher)

    it 'should create a rental for person' do
      expect(teacher.rentals).to include(rental)
    end

    it 'should create a rental for book' do
      expect(book.rentals).to include(rental)
    end
  end
end
