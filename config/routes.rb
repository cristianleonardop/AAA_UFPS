Rails.application.routes.draw do
  resources :tutorings
  resources :knowledges
  resources :subjects
  resources :homeworks
  get "/mercado_de_tareas", to: "homeworks#all_homeworks", as: :all_homeworks
  devise_for :users, controllers: { registrations: 'users/registrations' }
  namespace :admin do
    resources :users, path: 'usuarios'
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "homeworks#all_homeworks"

end
