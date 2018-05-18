Rails.application.routes.draw do
  resources :user, param: :email

  # mount User::API => '/'
end
