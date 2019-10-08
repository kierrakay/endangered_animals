#Our CLI controller
class EndangeredAnimals::CLI 
  
  def call 
   list_animals
   menu
   goodbye
  end 
  
  def list_animals
    #here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    #here doc which is giant string
    #.gsub /^\s+/, "" gets rid of indentation in the here doc
    puts "Current Endangered Animals:"
    puts <<-DOC.gsub /^\s+/, ""
      1. African Elephant’s - Scientific name: Loxodonta africana - Conservation status - Vulnerable
      2. African Wild Dog - Scientific name: Lycaon  pictus - Conservation Status - Endangered 
      DOC
  end 
  
  def menu 
    input = nil 
    while input != "exit" 
        puts "Select the animal you'd like to read more about or type list to see animals again or type exit to close:" #this is placed inside while loop so it is shown after a number for animal is selected and then user can continue to go back and forth betweween animals. you have recording of this on phone.
      input = gets.strip.downcase
      case input 
      when "1"
        puts "More info on animal 1..."
      when "2"
          puts "More info on animal 2..."
      when "list"
        list_animals
      end
    end
  end
  
  def goodbye 
    puts "See you tomorrow!"
  end
end