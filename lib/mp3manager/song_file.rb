# references the original audio file
#
# only saves a copy at the moment, renaming in place to come later (save_by_tags!)
#
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

require "mp3info"

module Mp3manager
  class SongFile

    attr_accessor :path, :tags

    def initialize(path)
      @path = path
      self.get_tags
    end

    # string representation for debugging
    def to_s
      "#{@path} -- tags: #{@tags.inspect}"
    end

    # propogate properties from id3 tags
    def get_tags
      # TODO: add error handling for path not being found
      Mp3Info.open(@path) do |mp3|
        # TODO: check to see if 'Unknown' should be overwritten in a more efficient manner
        @tags = mp3.tag
      end
    end

    # save a copy of the file, named via format
    def save_by_tags(format, dest)
      # build and clean file name
      filename = build_fname(format)
      filename = clean_fname(filename)

      dest_path = "#{dest}/#{filename}"
      if File.exists?("#{dest_path}.mp3")
        ctr = 1
        new_path = "#{dest_path}_#{ctr}"
        while File.exist?("#{new_path}.mp3")
          ctr++
            new_path = dest_path + ctr
        end
        dest_path = new_path
      end
      dest_path += ".mp3"
      puts "saving #{@path} as #{dest_path}"

      FileUtils.cp(@path, dest_path)
    end

    # save the MP3 in place
    def save_by_tags!
      # --
      # TODO: implement saving in place for rename jobs
      # ++
    end

    # clean the file name up
    # --
    # TODO: write some tests around this
    # ++
    def clean_fname(name)
      filename = name
      # replace joining characters with and
      filename.gsub!(/[,&\+]/, " and")
      # remove any other invalid characters
      filename.gsub!(/[^\s\(\)a-zA-Z0-9\\-]/, "")
      # squeeze whitespace
      filename.gsub!(/\s+/, " ")
      filename
    end

    # build a file name from a format
    # --
    # TODO: write some tests around this
    # ++
    def build_fname(format)
      f = format.dup
      tags = []
      # pull out all tag names
      tags = format.scan(/\[(.*?)\]/)
      # replace all tag names
      tags.each { |tag| 
        subval = @tags[tag[0]] && @tags[tag[0]].length ? @tags[tag[0]] : "UNKNOWN"
        f.gsub!(/\[#{tag[0]}\]/, subval) 
      }
      f
    end
  end
end
