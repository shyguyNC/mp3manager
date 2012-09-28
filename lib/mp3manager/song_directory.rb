# A collection of SongFile objects, collected from a specific directory
# --
# TODO: make a Collection class, and extend that with folder - this will allow us to pass in only specific files
# ++
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

require_relative "song_file"

module Mp3manager
  class SongDirectory

    attr_accessor :path

    def initialize(path)
      puts "loading mp3 files from #{path}"
      @path = path
      @files = []

      self.get_files
      puts "mp3 files loaded from #{path}"
    end

    def to_s
      "SongDirectory object -- path: #{@path}, files:\n#{@files}"
    end

    # build the internal array of SongFile objects
    #
    # we only push on .mp3 files for now
    #--
    # TODO: implement support for .wav, .aif, .mp4, etc.
    #++
    def get_files
      Dir.foreach(@path) do |file|
        if File.extname(file) == ".mp3"
          thisfile = SongFile.new("#{@path}/#{File.path(file)}")
          @files << thisfile
        end
      end
    end

    # save each SongFile object in the folder
    def save_by_tags(format, dest)
      # call save_by_tags on all SongFile objects
      @files.each { |mp3| mp3.save_by_tags(format, dest) }
    end

    # returns an array of unique tag values
    def get_unique_tag_values(tag)
      values = []
      @files.each { |mp3| 
        values << mp3.tags.tag if mp3.tags.tag.length
      }
      values.sort!
    end
  end
end
