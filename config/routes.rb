Rails.application.routes.draw do
  resources :todos
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Department', at: 'auth'

  mount_devise_token_auth_for 'Company', at: 'auth'
  as :company do
    # Define routes for Company within this block.
  end
  as :department do
    # Define routes for Department within this block.
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
