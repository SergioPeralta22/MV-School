require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'List of all books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def list_people
    puts 'List of all people:'
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person(role)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s

    if role == 'teacher'
      print 'Specialization: '
      specialization = gets.chomp.to_s
      person = Teacher.new(age, name, specialization)
    else
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.upcase
      parent_permission = parent_permission == 'Y'
      person = Student.new(age, name, parent_permission)
    end

    @people << person
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_number = gets.chomp.to_i - 1

    puts 'Select a person from the following list by number (not id)'
    list_people
    person_number = gets.chomp.to_i - 1

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(@books[book_number], @people[person_number], date)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person with ID #{person_id} not found."
    else
      puts "Rentals for #{person.name}:"
      rentals = @rentals.select { |rental| rental.person == person }
      rentals.each { |rental| puts "#{rental.book.title} (Date: #{rental.date})" }
    end
  end
end
