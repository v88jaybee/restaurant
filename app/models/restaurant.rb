class Restaurant < ApplicationRecord
	has_many :restaurant_reviews, dependent: :destroy

	validates :name, :cuisine_type, presence: true
  	validates :name, length: { minimum: 3 }
end
