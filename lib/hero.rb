class Hero
  attr_accessor :name, :role, :url, :overview, :abilities, :biography, :quote

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.all
    @@all
  end

end
