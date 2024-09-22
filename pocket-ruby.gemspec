require File.expand_path("../lib/pocket/version", __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency("sinatra", "~> 3")
  s.add_development_dependency("multi_xml")
  s.add_development_dependency("rake")
  s.add_development_dependency("standard")
  s.add_development_dependency("activesupport", ">= 7")
  s.add_development_dependency("simplecov")
  s.add_development_dependency("webmock")
  s.add_development_dependency("yard")
  s.add_runtime_dependency("faraday")
  s.add_runtime_dependency("simple_oauth")
  s.add_runtime_dependency("multi_json", ">= 1.15.0")
  s.authors = ["Turadg Aleahmad", "Jason Ng PT", "Andy Waite"]
  s.description = "A Ruby wrapper for the Pocket API v3 (Add, Modify and Retrieve)"
  s.email = ["turadg@aleahmad.net", "me@jasonngpt.com"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.files = `git ls-files`.split("\n")
  s.homepage = "https://github.com/andyw8/pocket-ruby"
  s.name = "pocket-ruby"
  s.platform = Gem::Platform::RUBY
  s.require_paths = ["lib"]
  s.required_rubygems_version = Gem::Requirement.new(">= 2.5.19") if s.respond_to? :required_rubygems_version=
  s.summary = "Ruby wrapper for the Pocket API v3"
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Pocket::VERSION
end
