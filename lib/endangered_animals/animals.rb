class EndangeredAnimals::Animals
  
  def self.currently
    #I should return a bunch of instances of animals
      puts <<-DOC.gsub /^\s+/, ""
      1. African Elephant’s - Scientific name: Loxodonta africana - Conservation status - Vulnerable
      2. African Wild Dog - Scientific name: Lycaon  pictus - Conservation Status - Endangered 
      DOC
  end 
  
end