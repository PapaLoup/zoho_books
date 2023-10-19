# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'zoho_books'
  s.version     = '0.0.7'
  s.summary     = 'Zoho Books API wrapper'
  s.description = 'A simple hello world gem'
  s.authors     = %w[PapaLoup Raphtml theobcl]
  s.email       = 'nick@quaran.to'
  s.files       = %w[lib/zoho_books.rb]
  s.files += Dir['lib/**/*.rb']
  s.homepage =
    'https://rubygems.org/gems/zoho_books'
  s.license = 'MIT'

  s.required_ruby_version = '>= 3.1.0'

  s.add_runtime_dependency 'httparty', '>= 0.18.0'
end
