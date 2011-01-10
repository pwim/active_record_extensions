require 'active_resource_extensions/railtie'
module ActiveResourceExtensions
  autoload :GracefulErrors, "active_resource_extensions/graceful_errors"
  def inherited(subclass)
    subclass.class_eval do
      class << self
        include ActiveResourceExtensions::GracefulErrors
      end
    end
  end
end
