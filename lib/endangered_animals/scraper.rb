class EndangeredAnimals::Scraper 
  
    def self.scrape_animals
      doc = Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory"))
      doc.css("td.keep a").each do |anchor|
        name = anchor.text.strip
        path = anchor.attribute("href").value
        url = "https://www.worldwildlife.org#{path}"
        animal = EndangeredAnimals::Animal.new(name, url) 
      end
           doc = Nokogiri::HTML(open("https://www.worldwildlife.org/species/directory?page=2"))
      doc.css("td.keep a").each do |anchor|
        name = anchor.text.strip
        path = anchor.attribute("href").value
        url = "https://www.worldwildlife.org#{path}"
        animal = EndangeredAnimals::Animal.new(name, url) 
      end # make more dryyyy
    end

    def self.scrape_animal_details(animal)
      new_animal_landing = Nokogiri::HTML(open("#{animal.url}"))
      list = new_animal_landing.css("ul.list-data.list-stats.list-items")
        
      animal.scientific_name  = list.css( "li:contains('Scientific Name')")
        animal.scientific_name .children.each { |c| c.remove if ((c.name == 'i') || (c.name == 'strong'))}
        animal.scientific_name  = animal.scientific_name.text.strip
      
      animal.habitat = list.css( "li:contains('Habitats')")
        animal.habitat.children.each { |c| c.remove if ((c.name == 'i') || (c.name == 'strong'))}
        animal.habitat = animal.habitat.text.strip
      
      animal.conservation_status = list.css( "li:contains('Status')")
        animal.conservation_status.children.each { |c| c.remove if ((c.name == 'i') || (c.name == 'strong'))}
        animal.conservation_status = animal.conservation_status.text.strip
      
      animal.description = new_animal_landing.css("div.wysiwyg.lead p") [0,2].text.strip 
    end 
      
end
    
    
    
    
  
