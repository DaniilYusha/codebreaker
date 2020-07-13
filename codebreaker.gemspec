# frozen_string_literal: true

require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = 'codebreaker'
  spec.version       = Codebreaker::VERSION
  spec.authors       = ['DaniilYusha']
  spec.email         = ['ilushenko79@gmail.com']

  spec.summary       = 'Gem for Codebreaker Game'
  spec.description   = 'Codebreaker is a logic game in which a code-breaker tries
                        to break a secret code created by a code-maker.'
  spec.homepage      = 'https://github.com/DaniilYusha/codebreaker'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.1')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/DaniilYusha/codebreaker'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'fasterer', '~> 0.8.3'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.87.1'
  spec.add_development_dependency 'simplecov', '~> 0.18.5'
end
