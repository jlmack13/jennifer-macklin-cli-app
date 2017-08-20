require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './hero.rb'

class Scraper

  def scrape_roster_page
    html = open("https://playoverwatch.com/en-us/heroes/")
    heroes = []
    doc = Nokogiri::HTML(html)
    doc.css(".hero-portrait-detailed-container").each do |card|
      hero_name = card.css(".container .portrait-title").text
      hero_url = card.css("a").attr("href").value
      heroes << {name: hero_name, url: hero_url}
    end
    heroes
  end

  #pass in individual hero url from roster to scrape details page
  def scrape_hero_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    hero = []
    hero_abilities = []
    doc.css(".hero-ability").each do |ability|
      hero_ability = ability.css(".hero-ability-descriptor .h5").text
      hero_description = ability.css(".hero-ability-descriptor p").text
      hero_abilities << {ability: hero_ability, description: hero_description}
    end
    hero << hero_abilities
    hero_biography = []
    doc.css("#story .hero-bio").each do |info|
      hero_real_name = info.css(".name .hero-bio-copy").text
      hero_occupation = info.css(".occupation .hero-bio-copy").text
      hero_base = info.css(".base .hero-bio-copy").text
      hero_affiliation = info.css(".affiliation .hero-bio.copy").text
      hero_biography << {real_name: hero_real_name, occupation: hero_occupation, base: hero_base, affiliation: hero_affiliation}
    end
    hero_quote = doc.css(".hero-detail.title").text
    hero_overview = doc.css("#overview .hero-detail-description").text
    hero << hero_quote
    hero << hero_overview
    hero << hero_biography
    hero
  end
  binding.pry



end
