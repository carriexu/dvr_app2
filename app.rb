require './controllers/application_controller'
class App < ApplicationController

  ########################
  # Routes
  ########################
  get('/') do
    render(:erb, :index)
  end
end
