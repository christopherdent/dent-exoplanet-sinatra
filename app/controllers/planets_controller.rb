require 'rack-flash'
class PlanetsController < ApplicationController
  use Rack::Flash

  # GET: /planets
  get "/planets" do
    if Helper.is_logged_in?(session)
        @user = Helper.current_user(session)
        @planets = Planet.all
          @planets.each do |planet|
            @planet = planet
          @star = Star.find_by_id(planet.star_id)
          end
          erb :"/planets/index"
    else
      redirect to '/login'
    end
  end

  # GET: /planets/new
  get "/planets/new" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @star = params[:star_name]
      erb :"/planets/new"
    else
      redirect to '/login'
    end
  end

  # POST: /planets
  post "/planets" do
    if Helper.is_logged_in?(session)
      @planets = Planet.all
      @planet = Planet.create(params[:planet])
      @star = Star.find_by_name(params[:star][:name])
      if @star == nil
        @star = Star.create(params[:star])
      else
        @planet.star = @star
      end
      @star.planets << @planet
      @planet.save
      flash[:message] = "Successfully added planet."
      redirect "/stars/#{@star.id}"
    else
      redirect to '/login'
     #redirect "/planets/#{@planet.id}"  -  seems to make more sense to redirect to the star show page, with planets listed and linked
   end
  end

  # GET: /planets/5
  get "/planets/:id" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @planet = Planet.find_by_id(params[:id])
      @star = Star.find_by_id(@planet.star_id)
      erb :"/planets/show"
    else
      erb :"/users/login"
    end
  end

  # GET: /planets/5/edit
  get "/planets/:id/edit" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @planet = Planet.find(params[:id])
      erb :"/planets/edit"
    else
      erb :"/users/login"
    end
  end

  # PATCH: /planets/5
  patch "/planets/:id" do
    @planet = Planet.find_by_id(params[:id])
    @planet.update(params[:planet])
    @star = Star.find_by(params[:star])
        if !@star.planets.include?(@planet)
          @star.planets << @planet
        end
    @planet.save
    redirect "/planets/#{@planet.id}"
  end

  # DELETE: /planets/5/delete
  delete "/planets/:id" do
    @planet = Planet.find(params[:id])
    @planet.delete
    redirect "/planets"
  end
end
