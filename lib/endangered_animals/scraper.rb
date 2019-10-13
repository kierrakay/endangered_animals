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
  
        #animal.habitat = list.css( "li:contains('Habitats')") might not need contains('Habitats')
         animal.habitat = list.css( "li:contains('Habitats')")
          animal.habitat.children.each { |c| c.remove if c.name == 'i' }
          animal.habitat.children.each { |c| c.remove if c.name == 'strong' }
          animal.habitat= animal.habitat.text.strip
         
      #animal.habitat = list.css( "li:contains('Habitats')").text.gsub("e"," ").gsub("Habitats"," ").strip
      # - will take out all the e's code above. need it to take out
      
      animal.conservation_status = data [0].text.strip.split(". ").join << "." if data.length >= 1
      animal.description = new_animal_landing.css("div.wysiwyg.lead p") [0,2].text.strip #gets first and second paragraph with [0,2]
    end 
      
  end
    
    #notes 
    #date to list 
    # animal.description = new_animal_landing.css("div.wysiwyg.lead p").first.text.strip #split(".").join  # #[0..3] return any range of elements? <-- gets first paragraph on page
    
 
#4 conservation status wrong.
#26 broke 
#29 conservation status and scientific name wrong .. should only display description
#26,29,31, 35 doesnt have scientific name so nothing should display
#35 broke
 #animal.habitat = list.css("li:nth-of-type(7) > div.container").text.strip.split(". ").join << "."  if data.length >= 7
      # code above kinda works still needs to specify habitat

    

    #how can i get it to not show list of animals in menu when n is selcted. have it only print that select prompt.