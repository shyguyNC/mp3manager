require_relative "../../test_helper"

describe Mp3manager do
  it "must be defined" do
    Mp3manager::VERSION.wont_be_nil
  end
end
