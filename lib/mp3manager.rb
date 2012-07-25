# mp3manager base class
# =
# currently supports only the method 'clone', which accepts a source folder and destination folder.
#
# clone take s any mp3 files found in source, and then saves them as artist - title by their id3 tags to destination.
#
# mp3manager is powered by moumar's mp3info gem
# https://github.com/moumar/ruby-mp3info
#
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby
# --
# TODO: implement format as an optional argument
# ++

require "mp3manager/version"
require "mp3manager/clone"

module Mp3manager
  def self.clone(format, source, dest)
  	job = Clone.new(format, source, dest)
  	job.run
  end
end
