class UsersController < ApplicationController

  get "/login" do
    if Helper.is_logged_in?(session)
      #user = User.find_by(username: params[:email])
      @user = session[:user_id]
      @user.name = params[username]
      redirect '/planets'
    else
      erb :'/users/login'
    end
  end

  get '/signup' do
    if Helper.is_logged_in?(session)
      redirect to '/planets'
    else
      erb :"/users/signup"
    end
  end

  get '/logout' do
    if Helper.is_logged_in?(session)
      session[:user_id] = nil
      erb :'/users/login'
    end
       redirect '/login'
  end

  post '/signup' do
    if Helper.empty_input?(params)
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/planets'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id  #Doing the loggin in
      redirect to '/planets'
    else
      redirect '/login'
    end
  end


    #get '/users/:slug' do
    #  @user = User.find_by_slug(params[:slug])
    #  erb :"/users/show"
    #end

end
