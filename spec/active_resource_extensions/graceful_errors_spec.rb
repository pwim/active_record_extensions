require 'spec_helper'
require 'active_resource'

describe ActiveResourceExtensions::GracefulErrors do
  before do
    @resource = mock_resource(ActiveResourceExtensions::GracefulErrors)
    Rails.logger = mock("logger")
    Rails.logger.stub!(:fatal)
  end

  describe "Errno::ECONNREFUSED thrown" do
    before { @resource.proc = lambda { raise Errno::ECONNREFUSED } }
    it("first should return nil") { @resource.first.should be_nil }
    it("all should return empty array") { @resource.all.should be_empty }
  end

  describe "ActiveResource::TimeoutError thrown" do
    before { @resource.proc = lambda { raise ActiveResource::TimeoutError.new("message") } }
    it("first should return nil") { @resource.first.should be_nil }
    it("all should return empty array") { @resource.all.should be_empty }
  end

  describe "arbitrary exception thrown" do
    before { @resource.proc = lambda { raise "arbitrary" } }
    it("first should raise exception") { lambda { @resource.first }.should raise_error }
  end
end
