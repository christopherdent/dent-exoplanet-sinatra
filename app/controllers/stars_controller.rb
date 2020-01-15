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
    redirect "/stars/#{@star.slug}"
  end

  # GET: /stars/5

  get '/stars/:slug' do
  #get "/stars/:id" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @star = Star.find_by_slug(params[:slug])
      #params["star"] = @star
      erb :"/stars/show"
    else
      erb :"/users/login"
    end
  end

  # GET: /stars/5/edit
  get "/stars/:slug/edit" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @star = Star.find_by_slug(params[:slug])
      erb :"/stars/edit"
    else
      erb :"/users/login"
    end
  end

  # PATCH: /stars/5
  patch "/stars/:slug" do

    @star = Star.find_by_slug(params[:slug])
    if @star && @star.user == Helper.current_user(session)
      @star.update(params[:star])
      @star.save
      redirect "/stars/#{@star.slug}"
    else
      flash[:warning] = "You can't edit someone else's star."
      redirect "/stars/#{@star.slug}"
    end
  end

  # DELETE: /stars/5/delete
  delete "/stars/:slug" do

    @star = Star.find_by_slug(params[:slug])
    if @star && @star.user == Helper.current_user(session)
      @star.planets.destroy_all
      @star.delete
      redirect "/stars"
    else
      flash[:warning] = "You can't delete someone else's star."
      redirect "/stars/#{@star.slug}"
    end
  end
end
