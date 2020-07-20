class Artist

  attr_accessor :name, :genres, :artist

  @@all = []

  def initialize(name)
    @name = name
    @artist = artist
    @songs = []
  end

  def add_song(new_song, song_artist=nil)
    # binding.pry
    if !new_song.artist
      new_song.artist = self
    elsif !Song.all.detect {|song| song == new_song }
      new_song = Song.new(new_song, self, new_song.genre)
      self.songs << new_song
    elsif !!new_song.artist && !Song.all.detect {|song| song == new_song }
      new_song = Song.new(new_song, new_song.artist, new_song.genre)
      self.songs << new_song
    end
  end

  def self.all
    @@all
  end

  def songs
    # binding.pry
    Song.all.each {|song| song.artist == self}
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.name = name
    #binding.pry
    artist.save
    artist
  end

end
