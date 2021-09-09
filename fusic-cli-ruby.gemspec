# frozen_string_literal: true

require_relative 'lib/fusic_cli_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'fusic-cli-ruby'
  spec.version       = Fusic::Cli::Ruby::VERSION
  spec.authors       = ['Yuhei Okazaki']
  spec.email         = ['okazaki@fusic.co.jp']

  spec.summary       = 'This is Fusic CLI.'
  spec.description   = 'git@github.com:fusic/fusic-cli-ruby.git'
  spec.homepage      = 'https://github.com/fusic/fusic-cli-ruby'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/fusic/fusic-cli-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/fusic/fusic-cli-ruby/blob/master/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'launchy', '~> 2.5.0'
  spec.add_dependency 'thor', '~> 1.1.0'
end
