# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cequens/version'

Gem::Specification.new do |spec|
  spec.name          = 'cequens'
  spec.version       = Cequens::VERSION
  spec.authors       = ['Ahmed Ali']
  spec.email         = ['ahmed.saraya90@gmail.com']

  spec.summary       = 'A library to interface with Cequens SMS gateway API.'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = 'https://github.com/AhmedAliIbrahim/cequens'
  spec.metadata['source_code_uri'] = 'https://github.com/AhmedAliIbrahim/cequens'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '=> 2.7'
  spec.add_dependency 'dry-validation', '~> 1.6'
  spec.add_dependency 'faraday', '~> 1.8'

  spec.add_development_dependency 'brakeman', '~> 5.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rails', '~> 6.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4'
  spec.add_development_dependency 'rubocop', '~> 1.10'
  spec.add_development_dependency 'webmock', '~> 3.11'
end
