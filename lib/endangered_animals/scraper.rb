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
    animal.description = new_animal_landing.css("div.wysiwyg lead p").text.split(". ") [0..3].join << "."#add period after third sentence?
    animal.habitat = new_animal_landing.css("div.container").text.split
    animal.scientific_name = new_animal_landing.css("div.container").text.split
    animal.conservation_status = new_animal_landing.css("div.container").text.split
    
  end 
    
end
  
  