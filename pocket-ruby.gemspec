require File.expand_path("../lib/pocket/version", __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency("sinatra", "~> 1.3.3")
  s.add_development_dependency("multi_xml")
  s.add_development_dependency("rake")
  s.add_development_dependency("test-unit")
  s.add_development_dependency("standardrb")
  s.add_runtime_dependency("faraday", [">= 0.7"])
  s.add_runtime_dependency("faraday_middleware")
  s.add_runtime_dependency("multi_json", ">= 1.0.3", "~> 1.0")
  s.authors = ["Turadg Aleahmad", "Jason Ng PT", "Andy Waite"]
  s.description = "A Ruby wrapper for the Pocket API v3 (Add, Modify and Retrieve) (fork)"
  s.email = ["turadg@aleahmad.net", "me@jasonngpt.com"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.files = `git ls-files`.split("\n")
  s.homepage = "https://github.com/andyw8/pocket-ruby-andyw8"
  s.name = "pocket-ruby-andyw8"
  s.require_paths = ["lib"]
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.rubyforge_project = s.name
  s.summary = "Ruby wrapper for the Pocket API v3 (fork)"
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Pocket::VERSION
end
