class Artist

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name)
    @name = name
    @artist = artist
    @songs = []
  end

  def add_song(new_song, song_artist=nil)
    if !new_song.artist
      new_song.artist = self
    # elsif !Song.all.detect {|song| song == new_song }
    #   song = Song.new(new_song, self, new_song.genre)
    #   self.songs << song
    # elsif !!new_song.artist && !Song.all.detect {|song| song == new_song }
    #   song = Song.new(new_song, new_song.artist, new_song.genre)
    #   self.songs << song
    # end
    end
  end

  def self.all
    @@all
  end

  def songs
    # binding.pry
    Song.all.each {|song| song.artist == self }
  end

  def genres
    genre_array = []
    Song.all.each  do |song|
      # binding.pry
      if song.artist == self
        genre_array << song.genre
      end
    end
    genre_array.uniq
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
