module HasToken
  class Railtie < Rails::Railtie
    initializer "has_token" do |app|
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Base.extend HasToken::ActiveRecord
      end
    end
  end
end
