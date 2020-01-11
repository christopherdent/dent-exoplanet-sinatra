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
    @star = Star.create(params[:star])
      if !params[:planet][:name].empty?
        @star.planets << Planet.create(params[:planet])
      end
      @star.save
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
      #binding.pry
      erb :"/stars/edit"

    else
      erb :"/users/login"
    end
  end

  # PATCH: /stars/5
  patch "/stars/:id" do

    @star = Star.find(params[:id])
    @star.update(params[:star])
    #if !params[:planet][:name].empty?
    #  @star.planets << Planet.create(params[:planet]) Not seeing need to allow new planet creation here.  think about it.
    #end
    @star.save
    redirect "/stars/#{@star.id}"
  end

  # DELETE: /stars/5/delete
  delete "/stars/:id" do
    @star = Star.find(params[:id])
    flash[:message] = "Warning - Deleting Star will Delete Associated Planets."
    @star.planets.destroy_all
    @star.delete
    redirect "/stars"
  end
end
