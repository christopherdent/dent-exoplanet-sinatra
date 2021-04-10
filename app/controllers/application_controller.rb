require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'exo'
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Validation

  end

  get '/' do
    @user = Helper.current_user(session)
    erb :index
  end




end
