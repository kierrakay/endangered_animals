class EndangeredAnimals::Scraper 
  
  def self.scrape_animals
    doc = Nokogiri:HTML(open(https://www.worldwildlife.org/species/directory))
    doc.css("td.keep").each do |animal|
      name = keep.css('a').text.strip
      path = keep.css("td.keep a").attribute("href").value
      url = "https://www.worldwildlife.org#{path}"
      animal = EndangeredAnimals::Animal.new(name, url) unless EndangeredAnimals::Animal.all.include?(animal)
    end
  end

  def self.scrape_animal_details(animal)
    new_animal_landing = Nokogiri::HTML(open("#{animal.url}"))
    animal.description = new_animal_landing.css("div.wysiwyg lead p").text.split(". ") [0..3].join << "."#add period after third sentence?
    animal.habit = new_animal_landing.css("div.container").text.split
    animal.scientific_name = new_animal_landing.css("div.container").text.split
    animal.conservation_status = new_animal_landing.css("div.container").text.split
    
  end 
    
end
  
  