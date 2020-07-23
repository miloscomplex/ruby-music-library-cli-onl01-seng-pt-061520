class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    input = gets.strip
    if input == "exit"
      exit
    end
  end

  def list_songs
    song_arr = Song.all.sort_by {|obj| obj.name}
    song_arr.each_with_index {|song, n|
      puts "#{n+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    # binding.pry
    artist_arr = Artist.all.sort_by {|obj| obj.name}
    artist_arr = artist_arr.map {|artist| artist.name}
    artist_arr.uniq!
    # binding.pry
    artist_arr.each_with_index {|artist, n|
      puts "#{n+1}. #{artist}"}
  end

  def list_genres
    # binding.pry
    genres_arr = Genre.all.sort_by {|obj| obj.name}
    genres_arr = genres_arr.map {|genre| genre.name}
    genres_arr.uniq!
    genres_arr.each_with_index {|genre, n|
      puts "#{n+1}. #{genre}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    song_arr = []
    Song.all.each do |song|
      if song.artist.name == input
        song_arr << song
      end
    end
    song_arr= song_arr.sort_by {|obj| obj.name }
    song_arr.each_with_index {|song, n|
      puts "#{n+1}. #{song.name} - #{song.genre.name}" }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre_arr = []
    Song.all.each do |song|
      if song.genre.name == input
        genre_arr << song
      end
    end
    genre_arr= genre_arr.sort_by {|obj| obj.name}
    # binding.pry
    genre_arr.each_with_index {|song, n|
      puts "#{n+1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    # list_songs
    input = gets.strip
    if input.to_i > 1 && input.to_i <= Song.all.count
      i = input.to_i - 1
      song_obj = Song.all.sort_by {|obj| obj.name}
      binding.pry
      puts "Playing #{song_obj[i].name} by #{song_obj[i].artist.name}"
    end
  end

end
