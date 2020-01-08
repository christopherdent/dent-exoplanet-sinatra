class StarsController < ApplicationController

  # GET: /stars
  get "/stars" do
    erb :"/stars/index"
  end

  # GET: /stars/new
  get "/stars/new" do
    erb :"/stars/new"
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

    @star = Star.find(params[:id])
    erb :"/stars/show"
  end

  # GET: /stars/5/edit
  get "/stars/:id/edit" do
    @star = Star.find(params[:id])
    erb :"/stars/edit"
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
