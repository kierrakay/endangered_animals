#Our CLI controller
class EndangeredAnimals::CLI 
  
  def call 
    puts "Current Endangered Animals:"
    list_animals
  end 
  
  def list_animals
    #here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts <<-- DOC #here doc which is giant string
      1. African Elephant’s - Scientific name: Loxodonta africana - Conservation status - Vulnerable
      2. African Wild Dog - Scientific name: Lycaon  pictus - Conservation Status - Endangered 
      DOC
  end 

end
