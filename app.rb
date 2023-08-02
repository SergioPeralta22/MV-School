require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  def initialize
    puts 'Welcome to School Library App!'
    @books = []
    @people = []
    @rentals = []
  end

  def load_person(person)
    if person[0] == 'Student'
      @people.push(Student.new(id: person[1], name: person[2], age: person[3], parent_permission: person[4]))
    elsif person[0] == 'Teacher'
      @people.push(Teacher.new(person[1], person[3], person[2], person[4]))
    end
  end

  def load_files
    if File.exist?('books.json')
      books_file = File.open('books.json')
      books_file_data = books_file.read
      books_json_file = JSON.parse(books_file_data)
      books_json_file.each do |book|
        @books.push(Book.new(book[0], book[1]))
      end
    end

    if File.exist?('people.json')
      people_file = File.open('people.json')
      people_file_data = people_file.read
      people_json_file = JSON.parse(people_file_data)
      people_json_file.each do |person|
        load_person(person)
      end
    end

    return unless File.exist?('rentals.json')

    rentals_file = File.open('rentals.json')
    rentals_file_data = rentals_file.read
    rentals_json_file = JSON.parse(rentals_file_data)
    rentals_json_file.each do |rental_data|
      book_data = rental_data[0]
      person_data = rental_data[1]
      date = rental_data[2]

      book = Book.new(book_data[0], book_data[1])
      person = Person.new(person_data[1], person_data[0])
      @rentals.push(Rental.new(book, person, date))
    end
  end

  def export_people
    people_array = []
    @people.each do |object|
      if object.is_a?(Student)
        people_array << [object.class, object.id, object.name, object.age, object.parent_permission]
      elsif object.is_a?(Teacher)
        people_array << [object.class, object.specialization, object.id, object.name, object.age]
      end
    end
    people_array
  end

  def write_files
    if @books.any?
      books_array = []
      @books.each do |object|
        books_array << [object.title, object.author]
      end
      books_json = JSON.generate(books_array)
      File.write('books.json', books_json)
    end

    if @people.any?
      people_array = export_people
      people_json = JSON.generate(people_array)
      File.write('people.json', people_json)
    end

    return unless @rentals.any?

    rentals_array = @rentals.map do |object|
      book_array = [object.book.title, object.book.author]
      person_array = [object.person.name, object.person.id]
      [book_array, person_array, object.date]
    end

    rentals_json = JSON.generate(rentals_array)
    File.write('rentals.json', rentals_json)
  end

  def list_books
    @books.each do |object|
      puts "Title: '#{object.title}', Author: #{object.author}"
    end
  end

  def list_people
    @people.each do |object|
      puts "[#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option_person = gets.chomp.to_i
    case option_person
    when 1
      print 'Age: '
      person_age = gets.chomp.to_i
      print 'Name: '
      person_name = gets.chomp.to_s
      print 'Has parent permission? [Y/N]: '
      person_permission = gets.chomp.downcase
      if person_permission.capitalize == 'N'
        @people.push(Student.new(age: person_age, name: person_name, parent_permission: false))
      else
        @people.push(Student.new(age: person_age, name: person_name))
      end
      puts 'Student created successfully'
    when 2
      print 'Age: '
      person_age = gets.chomp.to_i
      print 'Name: '
      person_name = gets.chomp.to_s
      print 'Specialization: '
      person_specialization = gets.chomp.to_s
      id = rand(1..1000)
      @people.push(Teacher.new(person_specialization, person_name, id, person_age))
      puts 'Teacher created successfully'
    else puts 'Error: Invalid number, try again'
         create_person
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp.to_s
    print 'Author: '
    book_author = gets.chomp.to_s
    @books.push(Book.new(book_title, book_author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |object, index|
      puts "#{index}) Title: '#{object.title}', Author: #{object.author}"
    end
    book_number = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |object, index|
      puts "#{index}) [#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp.to_s
    @rentals.push(Rental.new(@books[book_number], @people[person_number], date))
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |object|
      puts "Date: #{object.date}, Book '#{object.book.title}' by #{object.book.author}" if object.person.id == person_id
    end
  end
end
