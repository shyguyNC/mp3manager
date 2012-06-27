require_relative "../../test_helper"

describe Mp3manager::Job do
	def setup
		@job = Mp3manager::Job.new("clone")
	end

	# test that type property is set properly
	it "type must be a string" do
		@job.type.must_be_instance_of(String)
	end
end