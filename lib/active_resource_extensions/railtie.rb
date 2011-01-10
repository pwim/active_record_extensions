require 'rails/railtie'

module ActiveResourceExtensions
  class Railtie < Rails::Railtie
    initializer "active_resource_extensions.extend.active_resource" do |app|
      ActiveResource::Base.class_eval do
        class << self
          include ActiveResourceExtensions
        end
      end
    end
  end
end
