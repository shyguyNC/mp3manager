# mp3manager base class
# =
# currently supports only the method 'clone', which accepts a source folder and destination folder.
#
# clone takes any mp3 files found in source, and then saves them by id3 tags to destination, as specified by the format string.
#
# mp3manager is powered by moumar's mp3info gem
# https://github.com/moumar/ruby-mp3info
#
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

require "mp3manager/version"
require "mp3manager/clone"

module Mp3manager
  def self.clone(format, source, dest)
    job = Clone.new(format, source, dest)
    job.run
  end
end
