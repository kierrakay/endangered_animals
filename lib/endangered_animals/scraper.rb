class EndangeredAnimals::Scraper 
  
  def self.scrape_animals
    doc = Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory"))
    doc.css("td.keep a").each do |anchor|
      name = anchor.text.strip
      path = anchor.attribute("href").value
      url = "https://www.worldwildlife.org#{path}"
      animal = EndangeredAnimals::Animal.new(name, url) 
    end
  end

    def self.scrape_animal_details(animal)
      new_animal_landing = Nokogiri::HTML(open("#{animal.url}"))
      animal.scientific_name = new_animal_landing.css("div.container") [2].text.strip.split(". ").join << "."
      animal.habitat = new_animal_landing.css("div.container") [6].text.strip.split(". ").join << "."
      animal.conservation_status = new_animal_landing.css("div.container") [0].text.strip.split(". ").join << "."
      animal.description = new_animal_landing.css("div.wysiwyg.lead p") [0,2].text.strip #gets first and second paragraph with [0,2]
    end 
      
  end
    
    #notes 
    # animal.description = new_animal_landing.css("div.wysiwyg.lead p").first.text.strip #split(".").join  # #[0..3] return any range of elements? <-- gets first paragraph on page
    # - not all div.containers have the same amount of info so my indexes are messing up 
    # - some animals aren't endangered...like dolphin. do i need to make a custom error message for when it tries to find it's conservation status?
    # - this code only runs through to the third animal.
    # - when i hit n it still lists animals but has a prompt on how to exit not a big deal but still. 
    # - good bye statement returns nil after messsage