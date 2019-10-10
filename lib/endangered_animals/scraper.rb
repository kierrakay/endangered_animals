class Scraper 
  
  def self.scrape_animals
  doc = Nokogirr:HTML(open(https://www.worldwildlife.org/species/directory))
  doc.css(" ").each do |animal|
    name = .css(" ").text.strip 
    scientific_name = .css(" ").text.strip
    path = .css(" ").attribute("href").value
    url = 
    
end