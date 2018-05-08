Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_html_invoice'
  s.version     = '3.4.0'
  s.summary     = 'Print invoices from a spree order'
  s.required_ruby_version = '>= 2.2.7'
  s.authors = ["Torsten Ruger", "Chandramohan Rangaswamy"]

  s.files        = Dir['README.markdown', 'lib/**/*', 'app/**/*', 'config/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '~> 3.4.0')

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'capybara', '~> 2.6'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
end
