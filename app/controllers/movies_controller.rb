class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
      @comment = Comment.new
  end

  def new
    @movie = Movie.new
  end

  def create
    # render plain: params[:movie].inspect
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
      if @movie.update(movie_params)
        redirect_to movie_path(@movie)
      else
        render 'edit'
      end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path(@movie)
  end

  def movie_params
    params.require(:movie).permit(:tytuł, :rok_produkcji, :czas_trwania,  :opis)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
