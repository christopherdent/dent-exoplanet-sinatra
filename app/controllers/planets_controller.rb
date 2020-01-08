class PlanetsController < ApplicationController

  # GET: /planets
  get "/planets" do
  
    @user = User.find_by(params[:username])
    @planets = Planet.all
    @planets.each do |planet|
      @star = Star.find_by_id(planet.star_id)
    end
    erb :"/planets/index"
  end

  # GET: /planets/new
  get "/planets/new" do

    erb :"/planets/new"
  end

  # POST: /planets
  post "/planets" do
    @planets = Planet.all
    @planet = Planet.create(params[:planet])

    @star = Star.find_by_name(params[:star][:name])
    #binding.pry
    if @star == nil
      @planet.star = Star.create(params[:star])
    else
      @planet.star = @star
    end
    #@star.planets << @planet
    @planet.save
    redirect "/planets/#{@planet.id}"
  end

  # GET: /planets/5
  get "/planets/:id" do
    @planet = Planet.find_by_id(params[:id])
    @star = Star.find_by_id(@planet.star_id)
    erb :"/planets/show"
  end

  # GET: /planets/5/edit
  get "/planets/:id/edit" do
    @planet = Planet.find(params[:id])
    erb :"/planets/edit"
  end

  # PATCH: /planets/5
  patch "/planets/:id" do
    @planet = Planet.find_by_id(params[:id])
    @star = @planet.star
    @planet.update(params[:planet])
    if !params[:planet][:name].empty?
        @star.planets << Planet.create(params[:planet])
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
