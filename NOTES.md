How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point  - the file run 
4. Force that to build the CLI interface (CLI class)
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program


- A command line interface for endangered animals on worldwildlife.org

- Design:
-  User types in endangered animals
- Show a list of endangered animals
- "Executables is the file theyre running and it goes in the bin directory."

Ex: 
1. African Elephant’s - Scientific name: Loxodonta africana - Conservation status - Vulnerable
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


