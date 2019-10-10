#Our CLI controller
class EndangeredAnimals::CLI 
  
  def call 
    puts "Welcome To World Wild Life!! Where endangered animals are our friends, not food!".colorize(:light_blue)
 scrape_animals
 list_animals
  end 
  
  def list_animals
    puts "Would you like to view the list of endangered animals? Enter y or n:".colorize(:green)
    input = get.strip.downcase
    input = "y" ? menu : goodbye
  end 
  
  def scrape_animals 
    EndangeredAnimals::Scraper.scrape_animals
  end
  
  def display_animals
    Animals.all.each.with_index(1) do |animal,index|
      puts "#{index}. #{animal.name}"
    end
  end 
  
  def menu 
    display_animals
    puts "                                "
    puts "Select the number of the animal you'd like to learn more about or type exit to leave program.".colorize(:light_blue)
    puts "                                "
   
    input = gets.strip.to_i-1 
    number_of_animals = Animal.all.size
    
     # if input.to_i > 0 
        if input.between?(0, number_of_animals -1)
          index = input 
          
        animal = Animal.all[index]
        Scraper.scrape_animals_details(animal()
    #puts "More information about:".colorize(:light_blue)
        puts "                                            "
        puts "||Scientific Name||- #{animal.scientific_name}||"
        puts "                                            "
        puts "||Habitat|| #{animal.habitat}               "
        puts "                                            "
        puts "||Conservatin Status|| #{animal.conservation_status}"
        puts "                                            "
        puts " ||Description|| #{animal.description}      "
        puts "Type list to select another animal or type exit:".colorize(:green)
        
      elsif input == "list"
        list_animals 
      # else
      # puts "Not sure what you want? Type list or exit!".colorize(:yellow)
      end
    # ends
  end

  
 
  def goodbye 
    puts "See you later alligator!".colorize(:yellow)
  end
end












#   def menu 
#     input = nil 
#     while input != "exit" 
#         puts "Select the animal you'd like to read more about or type list to see animals again or type exit to close:" #this is placed inside while loop so it is shown after a number for animal is selected and then user can continue to go back and forth betweween animals. you have recording of this on phone.
#       input = gets.strip.downcase
#       case input 
#       when "1"
#         puts "More info on animal 1..."
#       when "2"
#           puts "More info on animal 2..."
#       when "list"
#         list_animals
#       else 
#       puts "Not sure what you want? Type list or exit!"
#       end
#     end
#   end
  
#   def goodbye 
#     puts "See you tomorrow cutie!"
#   end
# end