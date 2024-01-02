class AddImageUrlToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :image_url, :string
  end
end
