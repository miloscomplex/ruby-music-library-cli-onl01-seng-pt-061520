class Genre

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
  # Genres have many artists through their songs. Implement an `
  # artists` method for this association.

  def self.create(name)
    genre = Genre.new(name)
    genre.name = name
    #binding.pry
    genre.save
    genre
  end

  def artists

  end
end
