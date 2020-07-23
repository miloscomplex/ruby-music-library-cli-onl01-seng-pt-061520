
class Song

  attr_accessor :name, :artist, :genre
  # attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    self.genre=(genre)
    @@all << self
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    # binding.pry
    artist.add_song(self) if !artist.is_a? String
  end

  def genre=(genre)
    @genre = genre
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
    # song.name = name #<< called in init
    # song.save << called in init
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.new_from_filename(file_name)
    array = file_name.split(/\s-\s|\./)
    song = self.find_or_create_by_name(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2])
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

end
