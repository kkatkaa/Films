class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    # render plain: params[:movie].inspect
    movie_params = params.require(:movie).permit(:tytuł, :rok_produkcji, :czas_trwania,  :opis)
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie_params = params.require(:movie).permit(:tytuł, :rok_produkcji, :czas_trwania,  :opis)
    @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        redirect_to @movie
      else
        render 'edit'
      end
  end
end
