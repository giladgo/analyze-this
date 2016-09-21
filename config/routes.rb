Rails.application.routes.draw do

	resources :transactions, defaults: {format: 'json'}
  resources :categories, defaults: {format: 'json'}

end
