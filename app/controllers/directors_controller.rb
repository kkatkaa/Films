class DirectorsController < ApplicationController
  def new
  end
  def show
    @director = Director.find(params[:id])
  end
  # def create
  #   @director = Director.new(director_params)
  #   @director.save
  #   redirect_to @movie
  # end

  private
  def director_params
    params.require(:director).permit(:director_name)
  end
end
