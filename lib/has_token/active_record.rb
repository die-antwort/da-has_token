module HasToken
  module ActiveRecord
    def has_token(options = {})
      before_create HasToken::TokenGenerator.new(options)
    end
  end
end