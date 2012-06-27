# references the original audio file
#
# to be expanded with more tag names eventually
#
# only saves a copy at the moment, renaming in place to come later (save_by_tags!)
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

require "mp3info"

module Mp3manager
	class SongFile

		attr_accessor :path, :artist, :title

		def initialize(path)
			@path   = path
			@artist = 'Unknown'
			@title  = 'Unknown'
			# only two properties I care about right now,
			# BUT were this to be expanded to be useful to the general public
			# we'd want to include album, year, etc.
			self.get_tags
		end

		# string representation for debugging
		def to_s
			"#{@path} -- Artist: #{@artist} -- Title: #{@title}"
		end

		# propogate properties from id3 tags
		def get_tags
			# TODO: add error handling for path not being found
			Mp3Info.open(@path) do |mp3|
				# TODO: check to see if 'Unknown' should be overwritten in a more efficient manner
				@artist = mp3.tag.artist
				@title  = mp3.tag.title
			end
		end

		# save a copy of the file, named by the current artist/title
		def save_by_tags(dest)
			# TODO - make format for file name part of passed in arguments
			filename = "#{@artist} - #{@title}"
			# replace joing characters with and
			filename.gsub!(/[,&\+]/, " and")
			# remove any other invalid characters
			filename.gsub!(/[^\s\(\)a-zA-Z0-9\\-]/, "")
			# squeeze whitespace
			filename.gsub!(/\s+/, " ")

			dest_path = "#{dest}/#{filename}.mp3"
			puts "saving #{@path} as #{dest_path}"

			FileUtils.cp(@path, dest_path)
		end

		# save the MP3 in place
		def save_by_tags!
			# --
			# TODO: implement saving in place for rename jobs
			# ++
		end
	end
end