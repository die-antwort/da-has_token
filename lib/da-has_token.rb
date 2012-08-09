require "da-has_token/railtie"
require "da-has_token/active_record"

module HasToken
  autoload :TokenGenerator, "da-has_token/token_generator.rb"
end
