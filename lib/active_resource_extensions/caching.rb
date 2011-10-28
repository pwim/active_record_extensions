# To use this, you need config.cache_classes to be set to true.
module ActiveResourceExtensions
  module Caching
    private

    def find_every(options)
      Rails.cache.fetch(to_param + options.inspect, :expires_in => 1.hour) { super }
    end
  end
end
