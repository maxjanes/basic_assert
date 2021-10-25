require_relative 'lib/basic_assert/version'

Gem::Specification.new do |spec|
  spec.name          = 'basic_assert'
  spec.version       = BasicAssert::VERSION
  spec.authors       = ['Massimiliano Janes']
  spec.email         = ['massimiliano.janes@uqido.com']

  spec.summary       = 'A basic, customizable assertion library for lightweight pre-postconditions checking'
  spec.homepage      = 'https://github.com/maxjanes/basic_assert'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.files = Dir['{lib}/**/*', 'CHANGELOG.md', 'README.md']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
