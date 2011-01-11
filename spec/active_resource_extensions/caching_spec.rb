require 'spec_helper'

describe ActiveResourceExtensions::Caching do
  before do
    @resource = mock_resource(ActiveResourceExtensions::Caching)
    @resource.proc = lambda { [] }
    Rails.stub!(:cache).and_return(mock("cache"))
  end

  it "all should return the same value" do
    @resource.should_receive(:to_param).and_return("foo")
    Rails.cache.should_receive(:fetch).with("foo", :expires_in => 1.hour)
    @resource.all
  end
end
