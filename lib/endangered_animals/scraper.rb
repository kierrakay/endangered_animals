class EndangeredAnimals::Scraper 
  
  def self.scrape_animals
  doc = Nokogiri:HTML(open(https://www.worldwildlife.org/species/directory))
  doc.css("td.keep").each do |animal|
    name = first_animal.css('a').text.strip
    path = .css("td.keep a").attribute("href").value
    url = "https://www.worldwildlife.org#{path}"
    animal = EndangeredAnimals::Animal.new(name, url) unless Animal.all.include?(animal)
    end
  end

def self.scraper_animal_details(animal)
  new_page_landing = Nokogiri::HTML(open("#{animal.url}"))
  animal.description = new_page_landing.css("div.wysiwyg lead p").text.split(". ") [0..3].join << "."#add period after third sentence?
  animal.habit = new_page_landing.css("div.container").text.split
  animal.scientific_name = new_page_landing.css("div.container").text.split
  animal.conservation_status = new_page_landing.css("").text.split
  
    end 
    
end
  
  