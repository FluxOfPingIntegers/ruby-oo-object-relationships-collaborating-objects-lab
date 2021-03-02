class MP3Importer
attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir(@path) do | path |
        Dir.glob("*.mp3")
    end
  end

  def import
    filenames = self.files
    filenames.map do |i| i.delete_suffix!(".mp3")
    end
    filenames.each do |some_filename| Song.new_by_filename(some_filename)
    end
  end
end