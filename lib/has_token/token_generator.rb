module HasToken
  class TokenGenerator
    
    MAX_TRIES = 1000
    class NoMoreTokens < Exception; end
    
    def initialize(options = {})
      defaults = {:size => 10, :chars => "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0987654321"}
      options = defaults.merge(options)
      @chars, @size = options[:chars], options[:size]
    end
    
    def new_token
      token = ""
      @size.times { token << @chars[rand(@chars.length), 1] }
      token
    end
    
    def before_create(record)
      MAX_TRIES.times do
        return if !record.token.nil? && record.class.find_by_token(record.token) == nil
        record.token = new_token
      end
      raise NoMoreTokens
    end
  end
end