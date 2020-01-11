require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'exo'
    set :public_folder, 'public'
    set :views, 'app/views'

  end

  get '/' do

    erb :index
  end




end
