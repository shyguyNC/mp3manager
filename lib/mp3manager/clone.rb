# Clone opens all mp3 files from directory 'source' and saves them to directory 'dest'.
#
# The files are currently saved as Artist - Title only.
#
# Any existing contents in 'dest' will be deleted before formatted mp3s are copied in.
# --
# TODO: implement passed-in format
# TODO: implement ability to create folders from this format
# ++
#
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

require_relative "job"
require_relative "song_directory"

module Mp3manager
	class Clone < Job

		attr_accessor :source, :dest

		def initialize(source, dest)
			super("clone")
			@source = source
			@dest = dest
		end

		def to_s
			"#{super}, source: #{@source}, dest: #{@dest}"
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

			directory = SongDirectory.new(@source)
			directory.save_by_tags(@dest)
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