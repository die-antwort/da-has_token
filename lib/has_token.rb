require "has_token/railtie"
require "has_token/active_record"

module HasToken
  autoload :TokenGenerator, "has_token/token_generator.rb"
end
