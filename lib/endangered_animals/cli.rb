#Our CLI controller
class EndangeredAnimals::CLI 
  
  def call 
    puts "Welcome to World Wild Life!! Where endangered animals are our friends, not food!".colorize(:light_blue)
   list_animals
   menu
   goodbye
  end 
  
  def list_animals
    #here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    #here doc which is giant string
    #.gsub /^\s+/, '' gets rid of indentation in the here doc
    
    puts "Choose an animal you'd like to learn more about:".colorize(:green)
    # puts <<-DOC.gsub /^\s+/, ''
    #   1. African Elephant - Scientific name: Loxodonta africana - Conservation status - Vulnerable
    #   2. African Wild Dog - Scientific name: Lycaon pictus - Conservation status - Endangered 
    #   DOC
    #moved this code to animals.rb once we got the cli interface working.
    
    
    #   line below is saying I have an Object called capital a Animals that has a class method called "currently" that calls on class Animals that should return the animals with @animals. 
      @animals = EndangeredAnimals::Animals.currently
      @animals.each.with_index(1) do |animal,i|
        puts "#{1}. #{animal.name} - #{animal.scientific_name} - #{animal.conservation_status}"
      end
    end 
  
  def menu 
    input = nil 
    while input != "exit" 
      puts "Select the animal you'd like to read more about or type list to see animals again or type exit to close:".colorize(:light_blue)#this is placed inside while loop so it is shown after a number for animal is selected and then user can continue to go back and forth betweween animals. you have recording of this on phone.
      input = gets.strip.downcase
      
      if input.to_i > 0 
        the_animal = @animals[input.to_i-1]
        puts "#{the_animal.name} - #{the_animal.scientific_name} - #{the_animal.conservation_status}"
        #puts @animals[input.to_i-1] this hard codes string. above puts objects in variable.
      elsif input == "list"
        list_animals
      else
       puts "Not sure what you want? Type list or exit!"
      end
    end
  end
  
  def goodbye 
    puts "See you tomorrow cutie!"
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