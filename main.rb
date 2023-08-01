require_relative 'manage_option'
require_relative 'app'

def main
  app = App.new
  app.load_files
  manage_option = ManageOption.new
  manage_option.manage_option
end

main
