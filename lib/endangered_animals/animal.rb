
  class EndangeredAnimals::Animal

    attr_accessor :name, :url, :scientific_name, :habitat, :conservation_status, :description
   
    @@all = []
   
    def initialize (name, url)
      @name = name
      @url = url
      #@habitat = habitat
      # attributes.each do |key, value|
      # instance_variable_set("@#{key}", value)
      # @@all = []
      save 
    end 
  
  
  
    def self.all
      EndangeredAnimals::Scraper.scrape_animals if @@all.empty?
      @@all 
    end

    
    def save 
      @@all << self 
    end
    
   end
      
     
   
   
   
   
   
   
   
   
   
   
   
   
   
#   def self.currently
#     # scrape worldwildlife and return animals based on data 
#     #this method calls self.scrape_animals so the def self.scrape_animals  method should work
#     self.scrape_animals
#   end 
  
  
#   def self.scrape_animals 
#     url = "https://www.worldwildlife.org/species/directory"
#     unparsed_page = HTTParty.get(url)
#     parsed_page = Nokogiri::HTML(unparsed_page)
#     binding.pry
#   end
# end


    

   
   
   
   
   
   
   
  
  
  
  
  
  
  
  
  
  
  
  
  
#   def self.scrape_animals 
    
#     animals = []
    
#     animals << self.scrape_world_wild_life
    
#     #go to url, find animals 
#     #extract properties
#     #instantiate an animal 
    
   
#     animals 
#   end 
  
#   def self.scrape_world_wild_life
    
#     doc = Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory"))
#     binding.pry
#   end
# end
   
   
   
   
   
   
   
   
   
   
   
  #work on second page url and details of animal later
 # def self.currently
    #I should return a bunch of instances of animals and its properties, name Scientific conservation status url
      # puts <<-DOC.gsub /^\s+/, ''
      
#       1. African Elephant - Scientific name: Loxodonta africana - Conservation status - Vulnerable
#       2. African Wild Dog - Scientific name: Lycaon pictus - Conservation status - Endangered 
#       DOC
#       #step 1. delete this once you get working in console. other wise it'll list in console instead of just show instances. this list needs to be in cli.rb
#       #step 2. scrape website and return animals based off that data.
      
#       animal_1 = self.new 
#       animal_1.name = "African Elephant"
#       animal_1.scientific_name = "Loxodonta africana"
#       animal_1.conservation_status = "Vulnerable"
#       animal_1.url = "https://www.worldwildlife.org/species/directory"
      
#       animal_2 = self.new
#       animal_2.name = "African Wild Dog"
#       animal_2.scientific_name = "Lycaon pictus"
#       animal_2.conservation_status = "Endangered" 
#       animal_2.url = "https://www.worldwildlife.org/species/directory"
      
#       [animal_1, animal_2] #this will give you an array of the instances
      
#   end 
  
# end