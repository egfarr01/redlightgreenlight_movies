class UsersController < ApplicationController
  def myRLGLM
    @user = current_user
    @green_light_movies = @user.reviews.where(recommendation: true).map(&:movie)
    @red_light_movies = @user.reviews.where(recommendation: false).map(&:movie)
  end
end
