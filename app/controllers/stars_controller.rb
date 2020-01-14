require 'rack-flash'
class StarsController < ApplicationController
  use Rack::Flash

  # GET: /stars
  get "/stars" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      erb :"/stars/index"
    else
      erb :"/users/login"
    end
  end

  # GET: /stars/new

  get "/stars/new" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      erb :"/stars/new"
    else
      erb :"/users/login"
    end
  end

  # POST: /stars
  post "/stars" do
    @stars = Star.all
    @user = Helper.current_user(session)
    @star = Star.create(params[:star])
      if !params[:planet][:name].empty?
        @planet = Planet.create(params[:planet])
        @star.planets << @planet
        @user.planets << @planet
      end
      @star.save
    @user.stars << @star
    redirect "/stars/#{@star.id}"
  end

  # GET: /stars/5
  get "/stars/:id" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @star = Star.find(params[:id])
      params["star"] = @star
      erb :"/stars/show"
#if theres a star name can you add it to the params hash ?
    else
      erb :"/users/login"
    end
  end

  # GET: /stars/5/edit
  get "/stars/:id/edit" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @star = Star.find(params[:id])
      erb :"/stars/edit"
    else
      erb :"/users/login"
    end
  end

  # PATCH: /stars/5
  patch "/stars/:id" do

    @star = Star.find(params[:id])
    if @star && @star.user == Helper.current_user(session)
      @star.update(params[:star])
      @star.save
      redirect "/stars/#{@star.id}"
    else
      flash[:warning] = "You can't edit someone else's star."
      redirect "/stars/#{@star.id}"
    end
  end

  # DELETE: /stars/5/delete
  delete "/stars/:id" do

    @star = Star.find(params[:id])
    if @star && @star.user == Helper.current_user(session)
      @star.planets.destroy_all
      @star.delete
      redirect "/stars"
    else
      flash[:warning] = "You can't delete someone else's star."
      redirect "/stars/#{@star.id}"
    end
  end
end
