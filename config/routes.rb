Rails.application.routes.draw do
  resources :tutorings
  resources :knowledges
  resources :subjects
  resources :homeworks
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "public#index"
end
