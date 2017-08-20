require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  #get the page
  def get_page
    Nokogiri::HTML(open("https://playoverwatch.com/en-us/heroes/"))
  end

  #get the heroes
  def get_heroes
    self.get_page.css(".hero-portrait-detailed")
  end

  #make each hero

  #print the list of heroes
end
