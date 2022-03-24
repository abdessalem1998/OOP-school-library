require 'json'
module SaveRetrive

  def retrieve_books
    json = File.read('data/books.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |book|
        new_book = Book.new(book['title'], book['author'])
        new_book
      end
    end
  end

  def retrieve_rentals
    json = File.read('data/rentals.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |rental|
        person = if rental['person']['type'] == 'Student'
                   Student.new(rental['person']['name'],'class', rental['person']['parent_permission'],rental['person']['age'])
                 else
                   Teacher.new(rental['person']['age'], rental['person']['specialization'], rental['person']['name'])
                 end
        person.id = rental['person']['id']
        @people << person
        book = Book.new(rental['book']['title'], rental['book']['author'])
        @books << book
        Rental.new(rental['date'], book, person)
      end
    end
  end

  def retrieve_people
    json = File.read('data/people.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |people|
        person = if people['person']['type'] == 'Student'
          Student.new(people['person']['name'], 'class', people['person']['parent_permission'],people['person']['age'])
        else
          Teacher.new(people['person']['age'], people['person']['specialization'], people['person']['name'])
        end
        @people << person
      end
    end
  end

  def save
    books_obj = @books.map do |book|
      { title: book.title, author: book.author }
    end
    books_json = JSON.generate(books_obj)
    save_file('data/books.json', books_json)

    people_obj = @people.map do |people|
      { name: people.name, age: people.age, parent_permission: people.parent_permission }
    end
    people_obj = JSON.generate(people_obj)
    save_file('data/people.json', people_obj)

    rentals_obj = @rentals.map do |rental|
      { date: rental.date, person: { age: rental.person.age, name: rental.person.name, id:rental.person.id, parent_permission:rental.person.parent_permission }, book: { title: rental.book.title, author: rental.book.author }}
    end
    rentals_json = JSON.generate(rentals_obj)
    save_file('data/rentals.json', rentals_json)
  end

  def save_file(filename, json)
    file = File.new(filename, 'w')
    file.puts(json)
    file.close
  end
end
