class Hero
  attr_accessor :name, :role, :url, :overview, :abilities, :biography, :quote

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def get_details(index_url) #how do I want to do this? I feel like I should keep the scraping in the scraper class (duh), but how to get the info here?

  end

  def self.all
    @@all
  end

end
