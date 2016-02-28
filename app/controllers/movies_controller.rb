class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.order(params[:hashish])
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    # @movie = Movie.create!(movie_params)
    # @movie = Movie.find params[:id]
    # redirect_to movies_path
  end

  def updater
    
    id = params[:old][:title] # retrieve movie ID from URI route
    
    @movie = Movie.find_by_title(id)
    ntit = params[:movie][:newtitle]
    rel = params[:movie][:release_date]
    rat = params[:movie][:rating]
    
    if @movie
      if params[:movie][:newtitle].empty?
        hash = {title: id,rating: rat,release_date: rel}
        @movie.update_attributes!(hash)
        @movie.update_attributes!(movie_params)
        flash[:notice] = "'#{id}' Sucessfully Updated"
      
      else
        hash = {title: ntit,rating: rat,release_date: rel}
        @movie.update_attributes!(hash)
        @movie.update_attributes!(movie_params)
        flash[:notice] = "'#{id}' Sucessfully Updated"
      end
      
      
    else
      flash[:notice] = "Error! Movie Not Found"
    end
    
    redirect_to movies_path(@movie)
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movies_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
