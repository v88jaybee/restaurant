class CreateRestaurantReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_reviews do |t|
      t.references :restaurant, foreign_key: true
      t.string :customer_name
      t.integer :star_level
      t.text :description

      t.timestamps
    end
  end
end
