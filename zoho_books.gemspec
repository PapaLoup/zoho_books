Gem::Specification.new do |s|
  s.name        = "zoho_books"
  s.version     = "0.0.2"
  s.summary     = "Zoho Books API wrapper"
  s.description = "A simple hello world gem"
  s.authors     = ["PapaLoup"]
  s.email       = "nick@quaran.to"
  s.files       = %w[lib/zoho_books.rb lib/zoho_books/auth.rb lib/zoho_books/errors.rb lib/zoho_books/invoice.rb]
  s.homepage    =
    "https://rubygems.org/gems/zoho_books"
  s.license       = "MIT"

  s.add_dependency 'httparty', '~> 0.18.0'
end
