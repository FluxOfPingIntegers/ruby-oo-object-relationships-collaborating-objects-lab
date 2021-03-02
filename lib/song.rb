require 'pry'
class Song
attr_accessor :name, :artist

@@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def all
    Artist.all
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    filename = filename.split(" - ")
    x = Song.new(filename[1])
    y = Artist.find_or_create_by_name(filename[0])
    x.artist=(y)
    x
  end

  def artist_name=(the_name)
    x = Artist.find_or_create_by_name(the_name)
    self.artist=(x)
  end
end