class StarsController < ApplicationController

  # GET: /stars
  get "/stars" do
    if Helper.is_logged_in?(session)
      @user = User.find_by(params[:username])
      erb :"/stars/index"
    else
      erb :"/users/login"
    end
  end

  # GET: /stars/new

  get "/stars/new" do
    if Helper.is_logged_in?(session)
      @user = User.find_by(params[:username])
      erb :"/stars/new"
    else
      erb :"/users/login"
    end
  end

  # POST: /stars
  post "/stars" do
    @stars = Star.all
    @star = Star.create(params[:star])
    #binding.pry
    if !params[:planet][:name].empty?
        @star.planets << Planet.create(params[:planet])
      end
    @star.save
    redirect "/stars/#{@star.id}"
  end

  # GET: /stars/5
  get "/stars/:id" do
    if Helper.is_logged_in?(session)
      @user = User.find_by(params[:username])
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
      @user = User.find_by(params[:username])
      @star = Star.find(params[:id])
      erb :"/stars/edit"
    else
      erb :"/users/login"
    end
  end

  # PATCH: /stars/5
  patch "/stars/:id" do

    @star = Star.find(params[:id])
    @star.update(params[:star])
    if !params[:planet][:name].empty?
      @star.planets << Planet.create(params[:planet])
    end
    @star.save
    redirect "/stars/#{@star.id}"
  end

  # DELETE: /stars/5/delete
  delete "/stars/:id" do
    @star = Star.find(params[:id])
    @star.delete
    redirect "/stars"
  end
end
