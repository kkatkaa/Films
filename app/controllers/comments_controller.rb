class CommentsController < ApplicationController
  before_action :find_movie

  def show
      @comment = Comment.new
    end

  def create
      @comment = Comment.new(comment_params)
      @comment.movie = @movie
      if @comment.save
        redirect_to movie_path(@movie)
      else
        render 'movies/show'
      end
    end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end
