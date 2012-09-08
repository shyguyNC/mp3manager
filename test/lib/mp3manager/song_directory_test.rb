require_relative "../../test_helper"

describe Mp3manager::SongDirectory do
  def setup
    @dir = Mp3manager::SongDirectory.new(File.expand_path("../../../audio/source", __FILE__))
  end

  # test that source has been set
  it "must have a path (string)" do
    @dir.path.must_be_instance_of(String)
  end
end
