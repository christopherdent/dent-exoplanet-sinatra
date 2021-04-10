  require 'rack-flash'
class UsersController < ApplicationController
    use Rack::Flash

  get '/signup' do
    #if already logged in, redirect to the planets homepage
    if Helper.is_logged_in?(session)
      redirect '/planets'
    #otherwise show them the signup page.
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    #if the signup inputs are empty then reload the signup page
    if Helper.empty_input?(params)
      redirect to '/signup'
    #otherwise create the user and log them in then direct them to the planets page
    else
     @user = User.new(:username => params[:username], :password => params[:password])
     #check to see if username already exists and prompt them to try another if it does.
      if User.exists?(:username => params[:username])
        flash[:alert] = "Username Taken.  Try something else."
        redirect to '/signup'
      #otherwise, save the new user and log them in.
      else
      @user.save
      session[:user_id] = @user.id  #logging in
      redirect to '/planets'
      end
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

  get '/users/:id' do
    if Helper.is_logged_in?(session)
      @user = User.find(params[:id])
      erb :"/users/show"
    else
      erb :"/users/login"
    end
  end



  get '/logout' do
    if Helper.is_logged_in?(session)
      session.destroy
      session.clear
      redirect to '/'
    end
       redirect '/'
  end
end
