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
      animal.description = new_animal_landing.css("div.wysiwyg.lead p") [0,2].text.strip 
      # animal.description = new_animal_landing.css("div.wysiwyg.lead p").first.text.strip #split(".").join  # #[0..3] return any range of elements? <-- gets first paragraph on page
      animal.description = new_animal_landing.css("div.wysiwyg.lead p") [0,2].text.strip #gets first and second paragraph with [0,2]
    end 
      
  end
    
    