Rails.application.routes.draw do
  get 'search/search'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cities

  match '/search' => 'cities#search', via: :get
  root 'welcome#index'

end
