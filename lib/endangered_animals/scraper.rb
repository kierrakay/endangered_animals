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
      data = new_animal_landing.css("div.container")
      list = new_animal_landing.css("ul.list-data.list-stats")
     # list = new_animal_landing.css("ul.list-data.list-stats.list-items")
      animal.scientific_name = data.css("em")[0].text.strip.split(". ").join << "." if data.length >= 3
      animal.habitat = list.css( "li:contains('Habitats')").text.strip 
       #animal.habitat = list.css("li:nth-of-type(7) > div.container").text.strip.split(". ").join << "."  if data.length >= 7
      # code above kinda works still needs to specify habitat
      # animal.habitat = list.css("div.container").last.text.strip.split(". ").join << "." if data.length >= 7
      animal.conservation_status = data [0].text.strip.split(". ").join << "." if data.length >= 1
      animal.description = new_animal_landing.css("div.wysiwyg.lead p") [0,2].text.strip #gets first and second paragraph with [0,2]
    end 
      
  end
    
    #notes 
    #date to list 
    # animal.description = new_animal_landing.css("div.wysiwyg.lead p").first.text.strip #split(".").join  # #[0..3] return any range of elements? <-- gets first paragraph on page
    
 
#4 only habitat and conservation status wrong.
#23 habitat missing 
#26 broke 
#28 habitat wrong shows weight 
#29 habitat and status scientific name wrong. this doesnt have that info. should only display description
#31 doesnt have scientific name so nothing should display
#35 broke
#36 wrong habitat shows weight 
#48 habitat shows length which is last property 
#50 habitat missing 
    

    #how can i get it to not show list of animals in menu when n is selcted. have it only print that select prompt.