class ReviewsController < ApplicationController

  before_action :set_movie 
  def index
    @reviews = @movie.reviews
  end

  def set_movie 
    @movie = Movie.find(params[:movie_id])
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @review.movie
    else
      render 'new'
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:recommendation, :user_id)
  end
end
