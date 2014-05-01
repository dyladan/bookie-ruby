# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookie/version'

Gem::Specification.new do |spec|
  spec.name          = "bookie"
  spec.version       = Bookie::VERSION
  spec.authors       = ["Danny Dyla"]
  spec.email         = ["dyladan@gmail.com"]
  spec.summary       = %q{Manage an instance of Bookie bookmark server.}
  spec.description   = %q{Exposes a CLI and rubygem API for communitcating with a Bookie server in ruby.}
  spec.homepage      = "https://github.com/dyladan/bookie-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "configparser"
  spec.add_dependency "thor"
end
