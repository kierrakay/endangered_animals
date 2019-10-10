class Scraper 
  
  def self.scrape_animals
  doc = Nokogirr:HTML(open(https://www.worldwildlife.org/species/directory))
  doc.css(" ").each do |animal|
    name = .css(" ").text.strip 
    scientific_name = .css(" ").text.strip
    path = .css(" ").attribute("href").value
    url = "https://www.worldwildlife.org#{path}"
    animal = Animal.new(name, scientific_name, conservation_status, url) unless Animal.all.include?(animal)
    end
  end

def self.scraper_animal_details
  new_page_landing = Nokogiri::HTML(open("#{animal.url}"))
  animal.description = new_page_landing.css("").value 
  animal.habit = new_page_landing.css("").value 
  animal.scientific_name = new_page_landing.css("").value 
  animal.conservation_status = new_page_landing.css("").value 
  
    end 
    
end
  
  