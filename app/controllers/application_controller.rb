require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end 

#  get '/signup' do
#    if Helpers.is_logged_in?(session)
#      redirect to '/tweets'
#    else
#      erb :"/users/signup"
#    end
#  end

#  get "/login" do
#    if Helpers.is_logged_in?(session)
#      redirect '/tweets'
#    else
#      erb :'/users/login'
#    end
#  end


end
