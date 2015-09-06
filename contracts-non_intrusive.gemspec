# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contracts/non_intrusive/version'

Gem::Specification.new do |spec|
  spec.name          = "contracts-non_intrusive"
  spec.version       = Contracts::NonIntrusive::VERSION
  spec.authors       = ["Oleksii Fedorov"]
  spec.email         = ["waterlink000@gmail.com"]

  spec.summary       = %q{Non intrusive wrapper gem for contracts.ruby.}
  spec.description   = %q{This gem allows you to use static/dynamic analyzer tools together with contracts.ruby. It is achieved by allowing you to do the method mangling yourself.}
  spec.homepage      = "https://github.com/waterlink/contracts-non_intrusive"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
