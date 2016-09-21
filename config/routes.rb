Rails.application.routes.draw do

  resources :transactions, defaults: {format: 'json'}

end
