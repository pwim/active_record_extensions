# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_resource_extensions/version"

Gem::Specification.new do |s|
  s.name        = "active_resource_extensions"
  s.version     = ActiveResourceExtensions::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paul McMahon"]
  s.email       = ["paul@mobalean.com"]
  s.homepage    = "https://github.com/mobalean/active_resource_extensions"
  s.summary     = %q{Extensions to active resource}
  s.description = %q{A collection of extensions for active resource}

  s.rubyforge_project = "active_resource_extensions"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rails', "~> 3.0"
  s.add_development_dependency 'rspec', "~> 2.3.0"
end
