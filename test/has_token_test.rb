require 'test_helper'

class HasTokenTest < ActiveSupport::TestCase
  class MockModel
    attr_accessor :token
    @@instances = []
    
    def initialize(token = nil)
      self.token = token
      @@instances.push(self)
    end
    
    def find_by_token(token)
      @@instances.find { |i| i.token == token && i != self } || nil
    end
    
    def class
      self
    end
  end
  
  def test_new_token
    assert_not_nil HasToken::TokenGenerator.new.new_token
  end
  
  def test_new_token_size
    assert_equal 5, HasToken::TokenGenerator.new(:size => 5).new_token.length
    assert_equal 80, HasToken::TokenGenerator.new(:size => 80).new_token.length
  end
  
  def test_new_token_chars
    assert_match /a+/, HasToken::TokenGenerator.new(:chars => "a").new_token
  end
  
  def test_no_more_tokens_exception
    MockModel.new("a")
    assert_raise HasToken::TokenGenerator::NoMoreTokens do 
      HasToken::TokenGenerator.new(:chars => "a", :size => 1).before_create((model = MockModel.new))
    end
  end
end
