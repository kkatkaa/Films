class MoviesController < ApplicationController

  def new

  end

  def create
    # render plain: params[:movie].inspect
    movie_params = params.require(:movie).permit(:tytuł, :rok_produkcji, :reżyseria, :scenariusz, :gatunek, :czas_trwania, :opis)
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
