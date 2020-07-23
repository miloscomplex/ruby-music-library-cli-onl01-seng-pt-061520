class MusicImporter

  # attr_reader :file_path
  attr_accessor :file_path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    loaded_files = Dir.glob(path + "/*.mp3")
    loaded_files.map {|file| File.basename(file)}
  end

  def import
    files.each {|file| Song.create_from_filename(file) }
  end
  
end
