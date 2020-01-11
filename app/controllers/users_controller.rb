  require 'rack-flash'
class UsersController < ApplicationController
    use Rack::Flash

  get '/signup' do
    if Helper.is_logged_in?(session)
      redirect '/planets'
    else
      erb :"/users/signup" #locals: {message: "Please sign up before you sign in"}
    end
  end

  post '/signup' do
    if Helper.empty_input?(params)
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/planets'
    end
  end

  get "/login" do
    if Helper.is_logged_in?(session)
      redirect '/planets'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  #Doing the loggin in
      redirect to '/planets'
    else
      flash[:message] = "Please sign up before logging in."
      redirect '/signup'
    end
  end

  get '/logout' do
    if Helper.is_logged_in?(session)
      session.destroy
      session.clear
      redirect to '/login'
    end
       redirect '/'
  end

    #get '/users/:slug' do
    #  @user = User.find_by_slug(params[:slug])
    #  erb :"/users/show"
    #end

end
