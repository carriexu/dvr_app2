class ApplicationController < Sinatra::Base
########################
  # Configuration
  ########################
  # allow put/delete forms in browsers that don't support it.
  enable :method_override
  # store data between HTTP requests in a cookie
  enable :sessions
  # session_secret will change with every start of the application
  # if we want to run shotgun, which creates new application instances
  # we must manually set session_secret
  set :session_secret, 'super secret'

  configure :test, :development do
    $redis = Redis.new
  end
  configure :production do
    uri = URI.parse(ENV['REDISTOGO_URL'])
    $redis = Redis.new({:host => uri.host,
                        :port => uri.port,
                        :password => uri.password})
  end
end
