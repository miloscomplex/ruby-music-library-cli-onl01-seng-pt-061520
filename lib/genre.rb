class Genre

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :song
  # attr_reader :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def artists
    artists_array = []
    Song.all.each do |song|
      if song.genre == self
        artists_array << song.artist
      end
    end
    artists_array.uniq
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.name = name
    genre.save
    genre
  end

  def songs
    Song.all.each {|song| song.genre == self }
  end

end
