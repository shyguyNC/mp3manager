# Clone opens all MP3 files from directory 'source' and saves them to dest
#
# The files are currently saved as Artist - Title only
# --
# TODO: implement passed-in format
# TODO: implement ability to create folders from this format
# ++
#
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

require "job"
require "song_directory"

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
			directory = SongDirectory.new(@source)
			directory.save_by_tags(@dest)
		end

		# create new folders in @dest by artist - making this optional on v1.0
		def create_new_folders
			# --
			# TODO - call get_unique_artists on folder, loop through and create new folders in @dest
			# ++
		end	
	end
end