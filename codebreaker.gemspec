require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = "codebreaker"
  spec.version       = Codebreaker::VERSION
  spec.authors       = ["DaniilYusha"]
  spec.email         = ["ilushenko79@gmail.com"]

  spec.summary       = %q{
                          Codebreaker is a logic game in which a code-breaker tries
                          to break a secret code created by a code-maker. The codemaker,
                          which will be played by the application we’re going to write,
                          creates a secret code of four numbers between 1 and 6.
                        }
  spec.description   = %q{
                          The codebreaker gets some number of chances to break the code (depends on chosen difficulty).
                          In each turn, the codebreaker makes a guess of 4 numbers.
                          The codemaker then marks the guess with up to 4 signs - + or - or empty spaces.
                          A + indicates an exact match: one of the numbers in the guess is the same as one of the numbers
                          in the secret code and in the same position.
                          A - indicates a number match: one of the numbers in the guess is the same as one of the numbers
                          in the secret code but in a different position.
                          An empty space indicates that there is not a current digit in a secret number.
                          If codebreaker inputs the exact number as a secret number - codebreaker wins the game.
                          If all attempts are spent - codebreaker loses.
                          Codebreaker also has some number of hints(depends on chosen difficulty).
                          If a user takes a hint - he receives back a separate digit of the secret code.
                        }
  spec.homepage      = 'https://github.com/DaniilYusha/codebreaker'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/DaniilYusha/codebreaker'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'fasterer', '~> 0.8.3'
  spec.add_development_dependency 'rubocop'
end
