require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative './hero.rb'

class Roster

  def self.scrape_roster_page
    html = open("https://playoverwatch.com/en-us/heroes/")
    heroes = []
    doc = Nokogiri::HTML(html)
    doc.css(".hero-portrait-detailed-container").each do |card|
      hero_name = card.css(".container .portrait-title").text
      if hero_name.include?("ú")
        hero_name = hero_name.gsub(/ú/, 'u')
      elsif hero_name.include?("ö")
        hero_name = hero_name.gsub(/ö/, 'o')
      end
      hero_url = card.css("a").attr("href").value
      heroes << {name: hero_name, url: hero_url}
    end
    heroes.each do |hero|
      hero = Hero.new(hero[:name], hero[:url])
    end

  end


end
