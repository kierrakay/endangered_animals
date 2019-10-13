How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point  - the file run 
4. Force that to build the CLI interface (CLI class)
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

e
- A command line interface for endangered animals on worldwildlife.org

- Design:
-  User types in endangered animals
- Show a list of endangered animals
- "Executables is the file theyre running and it goes in the bin directory."

Ex: 
1. African Elephant’s - ScientLoxodonta africana - Conservation status - Vulnerable
2. African Wild Dog - Scientific name: Lycaon  pictus - Conservation Status - Endangered 

Which animal do you want to learn more about?

-Will give details about animal, it’s scientific name and conservation status.

*Load interperter and then environment so bin can grab files from lib
-ruby interperter is #!/usr/bin/env ruby in endangered_animals file

*How to run bin file
- you can do "ruby bin/endangered_animals" but you don't want to run CLI like this.
- I want to be able to do "./bin/endangered_animals" and run it how a user is going to run it when they install gem. 
  which is not through the ruby interperter explicity [ruby [<--this is the interperter] bin/endangered_animals] 
  but rather through bash [./ <-- this part looks for #! [shabang in endangered _ animals file] this is what users input -->./bin/endangered_animals]
- cd bin/ ...looks in the bin directory. so we will type that and then type ls -lah (list of all attributes in readable format)
it'll show that the file has (rw..read and write permissions but not rwxr permissions ..which is-rw-r--r-- 1 merry-paradigm-9237 merry-paradigm-9237   40 Oct  8 20:21 endangered_animals but not "rwxr" permissions ..the x is executable perrmisions. so to add the x in our file just type chmod +x endangered _ animals (without the space by underscore) to add those permissons. chmod is checkmod commands. now when we type/path file ./endagered _ animals we have now taught our operating system how to interpret this file using ruby with the #! shabang line and gave operating system permissions to execute the file through that interpereter on my behalf.

What is an animal?
-an animal has a common name
-an animal has a scientific name
-an animal has a conservation status 
-an animal has a url 
-an animal has details 
ific name: 

*Tricks 
 #here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    #here doc which is giant string
    #.gsub /^\s+/, "" gets rid of indentation in the here doc
  - when you want to test in console file type "./bin/console and run EndangeredAnimals:Animals.currently" to get instances. 
  -  @animals.each.with_index(1) do |animal,i|
   puts "#{1}. #{animal.name} - #{animal.scientific_name} - #{animal.conservation_status}".. the (1) if you chain 1 with the index itll start array at that index so we dont have to put -1 all the time. 

-  cli.rb
        the_animal = @animals[input.to_i-1]
        puts "#{the_animal.name} - #{the_animal.scientific_name} - #{the_animal.conservation_status}"
        #puts @animals[input.to_i-1] <-old code and we changed to above because now we have a variable to hold these objects. where as before we hard coded a string. 

*operation 
cli.rb 
-def list_animals method depends on the EndangeredAnimals::Animals.currently class method in order to return instances of @animals

-spec.add_dependency "nokogiri" added this in gemspec file to scrape
 -(spec.add_development_dependency "rspec") notice it doesnt have development and thats because its not a development one but is for everything

animals.rb 
-(open("https://www.worldwildlife.org/species/directory")) because youre saying open you need to have require "open-uri" in endangered_animals.rb 
  
animals.rb
keep = parsed_page.css('td.keep').... 
keep.count ...gives list of all animals on page
keep.first 
name of animal is = first_animal.css('a').text
- gets name of animal


how to parse
then do keep.first <enter>
then do first_animal = keep.first <enter> 
first_animal <enter> 
first_animal.css('') <-- to extract deeper based off what youre grabbing.

hot to run program in console 
- 

#notes 
    
     animal.habitat = list.css( "li:contains('Habitats')") might not need contains('Habitats')
    -why does it need (:contains ("habitats") ? because it's looking for that string to get the info for it!
   
     animal.habitat = list.css("li:nth-of-type(7) > div.container").text.strip.split(". ").join << "."  if data.length >= 7
       -code above kinda works still needs to specify habitat
      
    animal.description = new_animal_landing.css("div.wysiwyg.lead p") [0,2].text.strip -gets first and second paragraph with [0,2]
