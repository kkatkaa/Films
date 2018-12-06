class CommentsController < ApplicationController
  before_action :find_movie, only: [:create, :destroy]

  def create
    @comment = @movie.comments.create(comment_params)
    redirect_to movie_path(@movie)
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
