Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :companies, controllers: {
        sessions: "api/v1/companies/sessions",
        registrations: "api/v1/companies/registrations",
      }
      devise_for :departments, controllers: {
        sessions: "api/v1/departments/sessions",
        registrations: "api/v1/departments/registrations",
      }
      devise_for :users, controllers: {
        sessions: "api/v1/users/sessions",
        registrations: "api/v1/users/registrations",
      }
      resources :company_targets
      resources :department_targets
      resources :todo_targets
      resources :todos
    end
  end

  root to: 'application#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
