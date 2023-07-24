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
end
