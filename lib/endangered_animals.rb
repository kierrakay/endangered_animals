require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'pry'
require_relative "./endangered_animals/version"
require_relative './endangered_animals/animals'
require_relative './endangered_animals/cli' #now this cli class will be loaded

#this file acts as environment. its going to be a single file that loads my endangered_animals file or anything else im loading can require and itll load other dependecies like CLI class.
