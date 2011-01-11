module ActiveResourceExtensions
  module Caching
    private

    def find_every(options)
      Rails.cache.fetch(to_param, :expires_in => 1.hour) { super }
    end
  end
end
