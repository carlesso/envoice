require 'openid/store/filesystem' 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '395fe8fdf3c5325721db3fa2e6c59d05', '4a72139b788503d4b0cf2297d108df08'
  provider :openid, OpenID::Store::Filesystem.new('/tmp') 
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end