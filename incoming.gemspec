# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'incoming/version'

Gem::Specification.new do |spec|
  spec.name          = "incominghq"
  spec.version       = Incoming::VERSION
  spec.authors       = ["Calvin Yu"]
  spec.email         = ["me@sourcebender.com"]

  spec.summary       = %q{Interact with IncomingHQ service}
  spec.description   = %q{Interact with IncomingHQ service}
  spec.homepage      = "http://incominghq.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "apiture", "~> 0.2.1"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
