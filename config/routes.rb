Rails.application.routes.draw do
  devise_for :users
  resources :coupons, only: :index 
  get 'coupon' ,to: 'coupons#coupon'
  post 'coupon' ,to: 'coupons#validate'
  root 'coupons#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
