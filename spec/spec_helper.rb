Bundler.require_env(:test)
require File.join(File.dirname(__FILE__), '..', 'lib', 'watchtower')
require 'pp'

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)
  config.include(Webrat::Methods)
  config.include(Webrat::Matchers)

  config.before(:each) do
    MONGO.drop_collection('beams')
  end

  def app
    @app = Rack::Builder.new do
      run Watchtower::App
    end
  end
end
