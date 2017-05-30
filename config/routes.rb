Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cities
  get 'search' => 'cities#search'
  root 'welcome#index'

end
