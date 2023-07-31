require_relative 'app'
require_relative 'print_options'

class ManageOption
  def manage_option
    app = App.new
    print_options = PrintOptions.new
    loop do
      print_options.show
      option = gets.chomp.to_i
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
      when 7
        puts 'Thank you for using this app!'
        break
      else
        puts 'Error: Invalid number, try again'
      end
    end
  end
end
