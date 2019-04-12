Rails.application.routes.draw do

  root to: 'restaurants#index', to: redirect('/restaurants')
  get 'restaurants' 			=> 'restaurants#index'

  get 'restaurants/new' 		=> 'restaurants#new'
  post 'submit_restaurant' 		=> 'restaurants#create_restaurant'

  get 'restaurants/:id' 		=> 'restaurants#review'

  get 'restaurants/:id/edit'  => 'restaurants#edit'
  post 'update_restaurant'    => 'restaurants#update_restaurant'

  get 'restaurants/:id/delete' 	=> 'restaurants#delete'

  get 'restaurants/:id/review' 	=> 'restaurants#new_review'
  post 'submit_review'			=> 'restaurants#submit_review'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
