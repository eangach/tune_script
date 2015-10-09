# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tune_script/version'

Gem::Specification.new do |spec|
  spec.name          = 'tune_script'
  spec.version       = TuneScript::VERSION
  spec.authors       = ['Thomas Behrndt']
  spec.email         = ['thomas.behrndt@me.com']

  spec.summary       = 'Ruby gem to control iTunes using AppleScript'
  spec.description   = %q(Uses AppleScript scripts to drive iTunes. This is not a low level interface and will not be
as efficient as a low level interface. The main purpose is to have an interface which should still work when iTunes or
OSX is upgraded.)
  spec.homepage      = 'https://github.com/eangach/tune_script'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
end
