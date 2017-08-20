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
  def make_heroes
    self.get_heroes.each do |hero|
      hero = Hero.new
      hero.name = hero.css(".portrait-title").text
      hero.url = hero.css("a").attr["href"].value
    end
  end

  #print the list of heroes
  def print_roster
    self.make_heroes
    Hero.all.each do |hero|
      puts "#{hero.name}"
    end
  end
end
