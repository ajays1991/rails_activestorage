Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :story, only: %i[create show index]
  resources :post, only: %i[create show index]
end
