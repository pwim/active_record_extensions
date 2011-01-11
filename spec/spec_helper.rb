$:.unshift File.expand_path('../../lib', __FILE__)
require 'active_resource_extensions'
require 'active_resource'

def mock_resource(mod)
  mock = Class.new(ActiveResource::Base)
  mock.class_eval do
    class << self
      attr_accessor :proc
      def find_every(option)
        proc.call
      end
    end
  end
  resource = Class.new(mock)
  resource.class_eval(<<-EOD)
    class << self
      include #{mod}
    end
  EOD
  resource
end
