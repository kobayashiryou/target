Rails.application.routes.draw do
  devise_for :companies
  devise_for :departments
  devise_for :users
  resources :company_targets
  resources :department_targets
  resources :todo_targets
  resources :todos


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
