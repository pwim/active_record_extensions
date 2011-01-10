require 'spec_helper'
require 'active_resource'

describe ActiveResourceExtensions::GracefulErrors do
  before do
    mock = Class.new(ActiveResource::Base)
    mock.class_eval do
      class << self
        attr_accessor :exception

        def find_every(option)
          raise exception
        end
      end
    end
    @resource = Class.new(mock)
    @resource.class_eval do
      class << self
        include ActiveResourceExtensions::GracefulErrors
      end
    end
    Rails.logger = mock("logger")
    Rails.logger.should_receive(:fatal)
  end

  describe "Errno:ECONNREFUSED" do
    before { @resource.exception = Errno::ECONNREFUSED }
    it("first should return nil") { @resource.first.should be_nil }
    it("all should return empty array") { @resource.all.should be_empty }
  end
end
