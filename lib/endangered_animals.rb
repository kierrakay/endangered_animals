require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'colorize'
require 'pry'
require "endangered_animals/version"
require 'endangered_animals/animal'
require "endangered_animals/scraper" #now this cli class will be loaded
require 'endangered_animals/cli'

#this file acts as environment. its going to be a single file that loads my endangered_animals file or anything else im loading can require and itll load other dependecies like CLI class.
