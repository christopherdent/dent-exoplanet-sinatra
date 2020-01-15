require 'rack-flash'
class PlanetsController < ApplicationController
  use Rack::Flash

  # GET: /planets
  get "/planets" do
    if Helper.is_logged_in?(session)
        @user = Helper.current_user(session)
        @planets = Planet.all
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

  get '/planets/:slug' do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @planet = Planet.find_by_slug(params[:slug])
      @star = Star.find_by_id(@planet.star_id)
      erb :"/planets/show"
    else
      erb :"/users/login"
    end
end

  # POST: /planets
  post "/planets" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @planets = Planet.all
      @planet = Planet.create(params[:planet])
      @star = Star.find_by_name(params[:star][:name])  #@star is equal to the star found by params star name
        if @star == nil  #if find by name didnt f ind a star
          @star = Star.create(params[:star])  #create one
        else
          @planet.star = Star.find_by_name(params[:star][:name])
        end
      @planet.star_id = @star.id
      @star.planets << @planet
      @user.planets << @planet
      @user.stars << @star
      @planet.save
      flash[:message] = "Successfully added planet."
      redirect "/planets"
    else
      redirect to '/login'
    end
  end

  # GET: /planets/5/edit
  get "/planets/:slug/edit" do
    if Helper.is_logged_in?(session)
      @user = Helper.current_user(session)
      @planet = Planet.find_by_slug(params[:slug])
      erb :"/planets/edit"
    else
      erb :"/users/login"
    end
  end

  # PATCH: /planets/5
  patch "/planets/:slug" do
    @planet = Planet.find_by_slug(params[:slug])
    if @planet && @planet.user == Helper.current_user(session)

      @planet.update(params[:planet])
      @star = Star.find_by(params[:star])
        if !@star.planets.include?(@planet)
          @star.planets << @planet
        end
      @planet.save
    redirect "/planets/#{@planet.slug}"
    else

      flash[:warning] = "You can't edit someone else's planet."
      redirect "/planets/#{@planet.slug}"
    end
  end

  # DELETE: /planets/5/delete
  delete "/planets/:slug" do
    @planet = Planet.find_by_slug(params[:slug])

    if @planet && @planet.user == Helper.current_user(session)
      @planet.delete
    redirect "/planets"
    else
      flash[:warning] = "You can't delete someone else's planet."
      redirect "/planets/#{@planet.slug}"
    end
  end


  #get '/users/:slug' do
  #  @user = User.find_by_slug(params[:slug])
  #  erb :"/users/show"
  #end

end
