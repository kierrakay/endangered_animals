class EndangeredAnimals::Animals
  
  #work on second page url and details of animal later
  def self.currently
    #I should return a bunch of instances of animals and its properties, name Scientific conservation status url
      puts <<-DOC.gsub /^\s+/, ''
      
      1. African Elephant - Scientific name: Loxodonta africana - Conservation status - Vulnerable
      2. African Wild Dog - Scientific name: Lycaon pictus - Conservation Status - Endangered 
      DOC
      animal_1 = self.new 
      animal_name = "African Elephant"
      animal_1.scientific_name = "Loxodonta africana"
      animal_1.conservation_status = true 
      animal_1.url = "https://www.worldwildlife.org/species/directory"
      
      animal_2 = self.new
      animal_2.name = "African Wild Dog"
      animal_2.scientific_name = "Lycaon pictus"
      animal_2.conservation_status = true 
      animal_2.url = "https://www.worldwildlife.org/species/directory"
      
  end 
  
end