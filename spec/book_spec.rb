require_relative '../book'

describe Book do
  context 'Check if the instance is a class of Book' do
    book = Book.new('title', 'author')

    it 'should have a class of Book' do
      expect(book.instance_of?(Book)) == true
    end

    it 'should have the right title and author' do
      expect(book.title).to eq 'title'
      expect(book.author).to eq 'author'
    end
  end
end
