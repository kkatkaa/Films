class MoviesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_movie, only: [:edit, :update, :destroy]

  def index
    @movies = Movie.all.order(id: :desc)
    @movies = @movies.where("? = any(tags)", params[:q]) if params[:q].present?
    # @movies = @movies.where("tags IN (?)", params[:q]) if params[:q].present?
    # @movies = @movies.where("IN (?) = any(tags)", params[:q]) if params[:q].present?
  end

  def show
    @comment = Comment.new
  end

  def new
    @movie = Movie.new
    @user = User.new
  end

  def create
    # render plain: params[:movie].inspect
    @movie = Movie.new(movie_params)
    @movie.user = current_user if current_user
    if @movie.save
      flash[:notice] = "You've successfuly add the movie."
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
       flash[:notice] = "You've successfuly update the movie."
       redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    flash[:notice] = "You've delete the movie."
    redirect_to movies_path(@movie)
  end

  private

  def authorize_movie
    if current_user != @movie.user && !current_user&.admin?
      flash[:alert] = "You are not allowed to be here!"
      redirect_to movies_path
      false
    else
      true
    end
  end

  def movie_params
   params.require(:movie).permit(:title, :year, :image, :duration,  :description, :tags, :user)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
