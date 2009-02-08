require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Asset do
  before(:each) do
    @valid_attributes = {
      :file_file_name => "value for file_file_name",
      :file_content_type => "value for file_content_type",
      :file_file_size => 1,
      :file_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Asset.create!(@valid_attributes)
  end
end
