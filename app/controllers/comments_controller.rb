class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", only: :destroy
  before_action :find_movie

  def show
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.movie = @movie
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "You've successfuly add your comment."
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "You've successfuly update your comment."
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "You've delete your comment"
    redirect_to movie_path(@movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :body, :rating)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

end
