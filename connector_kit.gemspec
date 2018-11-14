$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "connector_kit/version"

Gem::Specification.new do |spec|
  spec.name          = "connector_kit"
  spec.version       = ConnectorKit::VERSION
  spec.authors       = ["Simon Jarbrant"]
  spec.email         = ["simonjarbrant@gmail.com"]

  spec.summary       = "A gem for communicating with the App Store Connect API."
  spec.description   = "A gem for communicating with the App Store Connect API."
  spec.homepage      = "https://github.com/simba909/connector_kit"
  spec.license       = "MIT"

  all_files  = `git ls-files`.split("\n")
  test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.files         = all_files - test_files
  spec.test_files    = test_files
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "httparty", "~> 0.16.3"
  spec.add_dependency "jwt", "~> 2.1", ">= 2.1.0"
end
