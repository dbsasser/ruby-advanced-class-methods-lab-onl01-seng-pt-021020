class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(file)
    file_name = file.chomp(".mp3").split(" - ")
    new_song = self.new 
    new_song.name = file_name[1]
    new_song.artist_name = file_name[0]
    new_song
  end
  
  def self.create_from_filename(file)
    file_name = file.chomp(".mp3").split(" - ")
    new_song = self.new 
    new_song.name = file_name[1]
    new_song.artist_name = file_name[0]
    new_song.save
    new_song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
