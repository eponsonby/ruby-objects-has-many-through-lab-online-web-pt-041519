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
  
  def songs
    Song.all.select do |song|
      song.genre == self
    end
  end
  
  def artists
    artists_in_genre = []
    Song.all.select do |song|
      if song.genre == self
        artists_in_genre << song.artist
      end
    end
    return artists_in_genre
  end
  
end
