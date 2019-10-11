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
      animal.scientific_name = new_animal_landing.css("div.container > em").text.split(". ") [0..3].join << "."
      animal.habitat = new_animal_landing.css("div.container first_element_child").text.split(". ") [0..3].join << "."
      animal.conservation_status = new_animal_landing.css("strong.hdr > div#container").text.split(". ") [0..3].join << "."
      #animal.description = new_animal_landing.css("div.wysiwyg.lead > p #text").text.split(". ") [0..3].join << "."
      animal.description = new_animal_landing.css("div.wysiwyg.lead p").text.split(" . ") [0..3].join #[0..3] return range of elements?
     
      
      
    end 
      
  end
    
    