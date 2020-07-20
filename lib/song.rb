
class Song

  attr_accessor :namez
  # attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist= artist
    #self.artist=(artist)
    @genre = genre
    @@all << self
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    # binding.pry
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.name = name
    song.save
    song
  end

end
