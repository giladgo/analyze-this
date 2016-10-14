Rails.application.routes.draw do

	resources :transactions, only: [:index], defaults: {format: 'json'}
	resources :categories, only: [:index], defaults: {format: 'json'} do
		member do
			get :transactions
		end
	end

	resources :merchants, only: [:index], defaults: {format: 'json'} do
		member do
			get :transactions
		end
	end

	resource :user, only: [:create], controller: :user, defaults: {format: 'json'}

end
