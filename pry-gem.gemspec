require './lib/pry-gem/version'

Gem::Specification.new do |s|
  s.name        = 'pry-gem'
  s.version     = PryGem::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'A collection of commands to work with gems within Pry'
  s.authors     = ['Kyrylo Silin', 'Robert Gleeson']
  s.email       = %w[silin@kyrylo.org]
  s.homepage    = 'http://pryrepl.org'
  s.license     = 'MIT'

  s.require_path = 'lib'
  s.files        = ['lib/pry-gem.rb', *Dir.glob('lib/**/*')]
  s.test_files   = Dir.glob('spec/**/*')

  s.required_ruby_version = '>= 1.9'

  s.add_dependency 'pry', '~> 0.12'

  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'rake', '~> 12.3'
end
