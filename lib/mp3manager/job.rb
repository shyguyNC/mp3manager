# base class for an mp3manager job object
#
# common functionality will include progress tracking, error handling, etc
#
# Author:: Danny Holyfield (shyguyncdnb@gmail.com)
# License:: Distributes under the same terms as Ruby

module Mp3manager
  class Job

    attr_reader :type

    def initialize(type)
      @type = type
    end

    def to_s
      "mp3manager Job Object --- type: #{@type}"
    end

    # run should be overridden in any classes that extend Job
    def run
      puts "#{@type}: this job doesn't know how to run"
    end
  end
end
