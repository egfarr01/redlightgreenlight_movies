class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.boolean :recommendation
      t.integer :user_id
      t.string :movie_id
      t.string :integer

      t.timestamps
    end
  end
end
