require 'pry'
class Artist
attr_accessor :name, :all
@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_song(song)
 #   binding.pry
    song.artist = self
    self.songs
  end

  def self.find_or_create_by_name(the_name)
    if Artist.all.any? {|i| i.name == the_name}
   #     binding.pry
      Artist.all.find do |i| i.name == the_name
        i
      end
    else
      Artist.new(the_name)        
    end
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|i| i.artist == self}
  end

  def print_songs
    Song.all.find do |i| if i.artist == self
    puts "#{i.name}"
    end
    end
  end
end