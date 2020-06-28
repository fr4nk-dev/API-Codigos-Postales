require 'oj'
require 'active_record'
require 'pg'
require 'logger'
require 'dalli'
require 'rack/cache'
require 'cuba'
require 'warden'
require './db'
require './app'
require './models/postal_code'
require './presenters/postal_codes'
require './authentication/token_strategy.rb'

if ENV['RACK_ENV'] == 'production'
  require 'rack/ssl'
  require 'rack/cors'

  use Rack::SSL
  
  use Rack::Cors do
    allow do
      origins '*', 'localhost:4200', '127.0.0.1:4200'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
          headers: 'x-domain-token',        
          max_age: 600     
    end  
  end
end


  

run Cuba
