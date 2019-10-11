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
      animal.habitat = new_animal_landing.css().text.split(" . ")[0,1].join #<< "." #fix
      animal.conservation_status = new_animal_landing.css("strong.hdr > div#container").text.split(". ") [0..3].join << "." #fix
      animal.description = new_animal_landing.css("div.wysiwyg.lead p").text.split(" . ")[0..1].join #[0..3] return any range of elements?
     
      
      
    end 
      
  end
    
    