gem 'sinatra',    :require_as => 'sinatra/base'
gem 'mongo'
gem 'mongo_ext',  :require_as => [ ]
gem 'mustache',   :require_as => 'mustache/sinatra'
gem 'nokogiri'

only :development do
  gem 'shotgun'
  gem 'rake'
  gem 'rack-bug',  :require_as => 'rack/bug'
end

only :test do
  gem 'rack-test', :require_as => 'rack/test'
end
