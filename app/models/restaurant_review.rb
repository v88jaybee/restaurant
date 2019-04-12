class RestaurantReview < ApplicationRecord
  	belongs_to :restaurant

  	validates :customer_name, :star_level, :description, presence: true
  	validates :customer_name, :description, length: { minimum: 3 }
  	validates :star_level, :inclusion => 1..5

  	def self.get_review(restaurant_id)
  		return RestaurantReview.where("restaurant_id =?", restaurant_id).order("star_level DESC")
  	end
end
