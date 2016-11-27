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

  resources :documents, only: [:create], controller: :documents, defaults: {format: 'json'}

	resource :auth, only: [], controller: :authentication, defaults: {format: 'json'} do
    collection do
      post :google
    end
  end

end
