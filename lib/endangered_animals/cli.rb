#Our CLI controller
class EndangeredAnimals::CLI 
  
    def call 
      puts "Welcome To World Wild Life!! Where endangered animals are our friends, not food!".colorize(:light_blue)
      scrape_animals
      list_animals
    end 
  
    def list_animals
      puts "Would you like to view the list of endangered animals? Enter y or n:".colorize(:green)
        input = gets.strip.downcase
        input == "y" ? menu : goodbye 
    end 
  
    def scrape_animals 
      EndangeredAnimals::Scraper.scrape_animals
    end
  
    def display_animals
      EndangeredAnimals::Animal.all.each.with_index(1) do |animal,index|
        puts "#{index}. #{animal.name}"
      end
    end 
  
    def menu 
      display_animals
        puts "                                "
        puts "Select the number of the animal you'd like to learn more about or type exit.".colorize(:light_blue)
        puts "                                "
   
      input = gets.strip.to_i-1  
      number_of_animals = EndangeredAnimals::Animal.all.size
    
   
        if input.between?(0, number_of_animals -1)
          index = input 
          
          animal = EndangeredAnimals::Animal.all[index]
          EndangeredAnimals::Scraper.scrape_animal_details(animal)
          puts "Fun facts about: #{animal.name}".colorize(:green)
          puts "                                            "
          puts "||Scientific Name|| #{animal.scientific_name}"
          puts "                                            "
          puts "||Habitat|| #{animal.habitat}               "
          puts "                                            "
          puts "||Conservation Status|| #{animal.conservation_status}"
          puts "                                            "
          puts " ||Description|| #{animal.description}      "
         
          list_animals 
   
        else 
          goodbye
        end
    end
 
    def goodbye 
      puts "See You Later, Alligator!".colorize(:yellow)
    end
  
end












