require_relative "../../test_helper"

describe Mp3manager::Clone do
	def setup
		# TODO: add real directories with sample mp3s in the test framework?
		@clone = Mp3manager::Clone.new("~/Music/source", "~/Music/dest")
	end

	# test that source has been set
	it "must have a source (string)" do
		@clone.source.must_be_instance_of(String)
	end

	# test that dest has been set
	it "must have a dest (string)" do
		@clone.dest.must_be_instance_of(String)
	end

	# TODO: write a test around making sure clone's job has run
end