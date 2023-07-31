require_relative 'app'
require_relative 'print_options'

def main
  app = App.new
  print_options = PrintOptions.new

  loop do
    print_options.show
    option = gets.chomp.to_i

    if option == 7
      puts 'Thank you for using this app!'
      break
    elsif option.between?(1, 6)
      case option
      when 1
        app.list_books
      when 2
        app.list_people
      when 3
        app.create_person
      when 4
        app.create_book
      when 5
        app.create_rental
      when 6
        app.list_rentals
      end
    else
      puts 'Error: Invalid number, try again'
    end
  end
end


main
