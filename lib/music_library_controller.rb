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
    input = gets.strip
    if input.to_i >= 1 && input.to_i <= Song.all.count
      i = input.to_i - 1
      song_obj = Song.all.sort_by {|obj| obj.name}
      puts "Playing #{song_obj[i].name} by #{song_obj[i].artist.name}"
    end
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    
    user_input = gets.chomp

    if user_input == "list songs"
      list_songs
    elsif user_input == "list artists"
      list_artists
    elsif user_input == "list genres"
      list_genres
    elsif user_input == "list artist"
      list_songs_by_artist
    elsif user_input == "list genre"
      list_songs_by_genre
    elsif user_input == "play song"
      play_song
    elsif user_input == "exit"
      exit
    end
  end

end
