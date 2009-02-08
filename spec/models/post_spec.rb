require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :slug => "value for slug",
      :published => false
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
end
