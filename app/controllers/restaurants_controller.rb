class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def create_restaurant
		if params[:process_type] == 'Cancel'
	        redirect_to '/restaurants'
	    elsif params[:process_type] == 'Register'
	       	@restaurant = Restaurant.new(restaurant_params)

	       	if @restaurant.save
	       		redirect_to '/restaurants', notice: "You have successfully registered a Restaurant!"
	       	else
	       		flash[:errors] = @restaurant.errors.full_messages
      			redirect_to '/restaurants/new'
	       	end
	    end
	end

	def update_restaurant
	    @restaurant = Restaurant.find(params[:restaurant_id])

	    if @restaurant.update(restaurant_params)
			redirect_to root_path, notice: "You have successfully updated a Dojo!"
	    else
			flash[:errors] = @restaurant.errors.full_messages
			redirect_to :controller => 'restaurants', :action => 'edit', id: params[:restaurant_id]
		end
	end

	def delete
	    Restaurant.find(params[:id]).destroy
	    redirect_to :root
	end

	def review
		@restaurant = Restaurant.find(params[:id])
		@restaurant_reviews = RestaurantReview.get_review(params[:id])
	end

	def new_review
		@restaurant = Restaurant.find(params[:id])
		@restaurant_review = RestaurantReview.new
	end

	def submit_review
		if params[:process_type] == 'Cancel'
	        redirect_to '/restaurants/'+restaurant_review_params[:restaurant_id].to_s
	    elsif params[:process_type] == 'Submit'

	       	@review = RestaurantReview.new(restaurant_review_params)

	       	if @review.save
	       		redirect_to :controller => 'restaurants', :action => 'review', id: restaurant_review_params[:restaurant_id]
	       	else
	       		flash[:errors] = @review.errors.full_messages
      			redirect_to :controller => 'restaurants', :action => 'new_review', id: restaurant_review_params[:restaurant_id]
	       	end
	    end
	end

	private
	    def restaurant_params
	      	params.require(:restaurant).permit(:name, :cuisine_type)
	    end

	    def restaurant_review_params
	      	params.require(:restaurant_review).permit(:restaurant_id,:customer_name, :star_level, :description)
	    end
end
