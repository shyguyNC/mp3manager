# Clone opens all mp3 files from directory 'source' and saves them to directory 'dest'.
#
# Supports formatting by id3 tags, ex: [artist] - [title].
#
# Non-existent tags will be replaced with the string "UNKNOWN".
#
# No files will be overwritten, duplicate files have a counter appended to the end of their file names if necessary.
#
# Any existing contents in 'dest' will be deleted before formatted mp3s are copied in.
# --
# TODO: implement ability to create folders from this format
# ++
#
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

require_relative "job"
require_relative "song_directory"

module Mp3manager
  class Clone < Job

    attr_accessor :format, :source, :dest

    def initialize(format, source, dest)
      super("clone")
      @format = format
      @source = source
      @dest = dest
    end

    def to_s
      "#{super}, format: #{@format}, source: #{@source}, dest: #{@dest}"
    end

    # create folders by unique artist in @dest, clone and copy from @source
    def run
      # return 0 if source and dest are the same
      # --
      # TODO: look into whether this should throw a custom error
      # it is possible that source and destination could be the same for a forthcoming rename job
      # ++
      if @source == @dest
        puts "source and destination folders cannot be the same for clone operations!"
        return 0
      end

      # create new SongDirectory object
      directory = SongDirectory.new(@source)

      puts "cloning mp3s to #{dest}"

      # create the directory if it doesn't exist
      # --
      # TODO: factor this out into another method, write a test for it
      # ++
      if !File.exists?(@dest)
        puts "#{@dest} not found, creating ..."
        Dir.mkdir(@dest)
      end

      # empty the contents of the directory
      # --
      # TODO: factor this out into another method, write a test for it
      # ++
      Dir.foreach(@dest) do |item|
        next if File.path(item) =~ /^\./
        path = File.absolute_path(item, @dest)
        if File.directory?(path)
          puts "deleting directory: #{path}"
          FileUtils.rm_rf(path)
        else
          puts "deleting file: #{path}"
          FileUtils.rm(path)
        end
      end

      # call the SongDirectory's save_by_tags method
      directory.save_by_tags(@format, @dest)
      puts "all files saved"
    end

    # create new folders in @dest by artist - making this optional on v1.0
    def create_new_folders
      # --
      # TODO - call get_unique_artists on folder, loop through and create new folders in @dest
      # ++
    end	
  end
end
