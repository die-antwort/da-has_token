$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "da-has_token/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "da-has_token"
  s.version     = HasToken::VERSION
  s.authors     = ["Stefan Daschek", "Moritz Kobrna"]
  s.email       = ["stefan@die-antwort.eu", "mo@die-antwort.eu"]
  s.homepage    = "https://github.com/die-antwort/da-has_token"
  s.summary     = "Simple has_token plugin for Rails (Active Record)."
  s.description = "Use `has_token` in your model to automatically generate a unique token on before_create. (Model needs to have a `token` field with type string.)"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0", "< 6.0"

  s.add_development_dependency "sqlite3"
end
