require_relative "../../test_helper"

describe Mp3manager::Clone do
	def setup
		@source = File.expand_path("../../../audio/source", __FILE__)
		@dest = File.expand_path("../../../audio/dest", __FILE__)
		@clone = Mp3manager::Clone.new(@source, @dest)
		@clone_bad = Mp3manager::Clone.new(@source, @source)
	end

	# test that source has been set
	it "must have a source (string)" do
		@clone.source.must_be_instance_of(String)
	end

	# test that dest has been set
	it "must have a dest (string)" do
		@clone.dest.must_be_instance_of(String)
	end

	# test that we return if source and destination are the same (for now)
	it "source and destination cannot be the same" do
		@clone_bad.run.must_equal(0)
	end

	# TODO: write a test around making sure clone's job has run
end