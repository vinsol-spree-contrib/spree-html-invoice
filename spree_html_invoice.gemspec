Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_html_invoice'
  s.version     = '4.1'
  s.summary     = 'Print invoices from a spree order'
  s.required_ruby_version = '>= 2.5'
  s.authors = ["Torsten Ruger", "Chandramohan Rangaswamy"]

  s.files        = Dir['README.markdown', 'lib/**/*', 'app/**/*', 'config/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  spree_version = '>= 4.1'

  s.add_dependency 'spree_core'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'capybara', '~> 3.32'
  s.add_development_dependency 'database_cleaner', '~> 1.8.5'
  s.add_development_dependency 'factory_bot', '~> 5.2'
  s.add_development_dependency 'ffaker', '~> 2.2'
  s.add_development_dependency 'rspec-rails', '~> 4.0', '>= 4.0.1'
  s.add_development_dependency 'simplecov', '~> 0.18.5'
  s.add_development_dependency 'sqlite3', '~> 1.4'
  s.add_development_dependency 'coffee-rails', '~> 5.0'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'sass-rails', '~> 6.0'
  s.add_development_dependency 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  s.add_development_dependency 'shoulda-matchers'
end
