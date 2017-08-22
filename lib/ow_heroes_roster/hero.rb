require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'

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
    @biography = {}
    doc.css("#story .hero-bio").each do |info|
      hero_real_name = info.css(".name .hero-bio-copy").text
      hero_occupation = info.css(".occupation .hero-bio-copy").text
      hero_base = info.css(".base .hero-bio-copy").text
      hero_affiliation = info.css(".affiliation").text
      @biography = {real_name: hero_real_name, occupation: hero_occupation, base: hero_base, affiliation: hero_affiliation}
    end

    #quote
    @quote = doc.css("#story p.h4").text
  end

  #display hero details
  def display_information
    get_details(url)
    puts "\n--------------------------------".colorize(:yellow)
    print "\n**".colorize(:magenta)
    print " #{self.name.upcase}".colorize(:white)
    puts  " **".colorize(:magenta)
    puts "\n--------------------------------".colorize(:yellow)
    puts "\nROLE: #{self.role}".colorize(:yellow)
    puts "--------------------------------".colorize(:magenta)
    puts "OVERVIEW:".colorize(:yellow)
    puts "#{self.overview}".colorize(:white)
    puts "--------------------------------".colorize(:magenta)
    puts "ABILITIES:\n".colorize(:yellow)
    self.abilities.each do |ability|
      puts "*#{ability[:ability]}: #{ability[:description]}".colorize(:white)
    end
    puts "--------------------------------".colorize(:magenta)
    puts "BIOGRAPHY:\n".colorize(:yellow)
    self.biography.each_value {|value| puts "\t*#{value}".colorize(:white) }
    puts "\n--------------------------------".colorize(:magenta)
    if self.quote != ""
      puts "QUOTE: #{self.quote}".colorize(:yellow)
      puts "--------------------------------".colorize(:magenta)
    end
  end

  def self.all
    @@all
  end

end
