class GenresController < ApplicationController
  before_action :find_genre, only: [:show, :edit, :update, :destroy]

def index
  @genres = Genre.all
end

def show
end

def new
  @genre = Genre.new
end

def edit
end

def create
  @genre = Genre.new(genre_params)
  if @genre.save
    flash[:notice] = "You've successfuly add the genre."
    redirect_to genre_path(@genre)
  else
    render 'new'
  end
end

def update
  if @genre.update(genre_params)
     flash[:notice] = "You've successfuly update the genre."
     redirect_to genre_path(@genre)
  else
    render 'edit'
  end
end

def destroy
  @genre.destroy
  flash[:notice] = "You've delete the genre."
  redirect_to genres_path(@genre)
end

private

  def find_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
