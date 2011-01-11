require 'active_resource_extensions/railtie'
module ActiveResourceExtensions
  autoload :GracefulErrors, "active_resource_extensions/graceful_errors"
  autoload :Caching, "active_resource_extensions/caching"
  def inherited(subclass)
    subclass.class_eval do
      class << self
        # Caching is included before GracefulErrors to avoid caching error
        # results
        include ActiveResourceExtensions::Caching
        include ActiveResourceExtensions::GracefulErrors
      end
    end
  end
end
