require 'open-uri'
require 'nokogiri'
require 'pry'

class Hero
  attr_accessor :name, :role, :url, :path, :overview, :abilities, :biography, :quote

  @@all = []

  def initialize(name, path)
    @name = name
    @url = "https://playoverwatch.com#{path}"
    @@all << self
  end

  def self.find_by_name(name)
    self.all.find{|hero| hero.name == name}
  end

  #get details by scraping hero page
  def get_details(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    #role
    @role = doc.css(".hero-detail-role-name").text

    #overview
    @overview = doc.css("#overview .hero-detail-description").text

    #abilities
    @abilities = []
    doc.css(".hero-ability").each do |ability|
      hero_ability = ability.css(".hero-ability-descriptor .h5").text
      hero_description = ability.css(".hero-ability-descriptor p").text
      @abilities << {ability: hero_ability, description: hero_description}
    end

    #biography
    @biography = []
    doc.css("#story .hero-bio").each do |info|
      hero_real_name = info.css(".name .hero-bio-copy").text
      hero_occupation = info.css(".occupation .hero-bio-copy").text
      hero_base = info.css(".base .hero-bio-copy").text
      hero_affiliation = info.css(".affiliation").text
      @biography << {real_name: hero_real_name, occupation: hero_occupation, base: hero_base, affiliation: hero_affiliation}
    end

    #quote
    @quote = doc.css("#story p.h4").text
  end

  #display hero details
  def display_information
    get_details(url)
    puts "Name: #{self.name}"
    puts "Role: #{self.role}"
    puts "-----------------------------"
    puts "Overview:\n #{self.overview}"
    puts "-----------------------------"
    puts "Abilities:\n"
    self.abilities.each do |ability|
      puts "*#{ability[:ability]}: #{ability[:description]}"
    end
  end

  def self.all
    @@all
  end

end
