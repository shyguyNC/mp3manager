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

		# build the internal array of MP3file objects
		#
		# we only push on .mp3 files for now
		#--
		# TODO: implement support for .wav, .aif, .mp4, etc.
		#++
		def get_files
			Dir.foreach(@path) do |file|
				if File.extname(file) == ".mp3"
					thisfile = SongFile.new("#{@path}/#{File.path(file)}")
					@files.push(thisfile)
				end
			end
		end

		# save each MP3file object in the folder
		def save_by_tags(dest)
			# create the directory if it doesn't exist
			#--
			# TODO: move this to MP3clone - MP3folder shouldn't worry about what's there, or even know that they're cloning!
			#++
			if !File.exists?(dest)
				puts "#{dest} not found, creating ..."
				Dir.mkdir(dest)
			end

			# empty the contents of the directory
			#--
			# TODO: move this to MP3clone, it's job-specific
			#++
			Dir.foreach(dest) do |item|
				next if File.path(item) =~ /^\./
				path = File.absolute_path(item, dest)
				if File.directory?(path)
					puts "deleting directory: #{path}"
					FileUtils.rm_rf(path)
				else
					puts "deleting file: #{path}"
					FileUtils.rm(path)
				end
			end

			# call save_by_tags on all MP3file objects
			@files.each { |mp3| mp3.save_by_tags(dest) }
		end

		# returns an array of unique artist names
		def get_unique_artists
			artists = []
			@files.each { |mp3| 
				#--
				# TODO: check for existence of mp3's artist in array, push if not found
			}
			# TODO: sort artist by artist name before returning
			#++
			artists
		end
	end
end