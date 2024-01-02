class MoviesController < ApplicationController
  def index
  @movies = Movie.all
  @movie = Movie.new

  if params[:search].present?
    @movies = @movies.where('title LIKE ?', "%#{params[:search]}%")
  end

  params[:sort] ||= 'title'

  @green_lights = Hash.new(0)
  @red_lights = Hash.new(0)
  @lights_ratio = Hash.new(0)

  @movies.each do |movie|
    @green_lights[movie.id] = movie.reviews.where(recommendation: true).count
    @red_lights[movie.id] = movie.reviews.where(recommendation: false).count
    @lights_ratio[movie.id] = @green_lights[movie.id].to_f / [@red_lights[movie.id], 1].max
  end

  if params[:sort].present?
    case params[:sort]
    when 'green_lights'
      @movies = @movies.sort_by { |movie| -@green_lights[movie.id] }
    when 'red_lights'
      @movies = @movies.sort_by { |movie| -@red_lights[movie.id] }
    when 'lights_ratio'
      @movies = @movies.sort_by { |movie| -@lights_ratio[movie.id] }
    else
      @movies = @movies.order(params[:sort])
    end
  end

  @movies = Kaminari.paginate_array(@movies).page(params[:page]).per(10)
end

def show
  @movie = Movie.find(params[:id])
  total_reviews = @movie.reviews.count
  if total_reviews > 0
    @green_lights = (@movie.reviews.where(recommendation: true).count / total_reviews.to_f) * 100 if total_reviews > 0
    @red_lights = (@movie.reviews.where(recommendation: false).count / total_reviews.to_f) * 100 if total_reviews > 0 
  else 
    @green_lights = 0
    @red_lights = 0
  end
end

  def new
    @movie = Movie.new
  end

  def create
  @movies = params[:movies].values.map do |movie_params|
    Movie.new(movie_params.permit(:title, :description, :image_url))
  end

  if @movies.all?(&:valid?)
    @movies.each(&:save)
    redirect_to movies_path, notice: 'Movies were successfully created.'
  else
    render :new
  end
end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
  @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
        redirect_to @movie
    else
        render 'edit'
    end
  end

  def destroy
  @movie = Movie.find(params[:id])
    if @movie.destroy
        redirect_to movies_path, notice: "Movie successfully deleted"
    else
        redirect_to movies_path, alert: "Error deleting movie"
    end
  end

  private

  def movie_params
  params.require(:movie).permit(:title, :description, :image_url)
end

  
end
