Rails.application.routes.draw do
  root 'events#index'
  resources  :users,     only: [:new, :create, :show]
  resources  :sessions,  only: [:new, :create, :destroy]
  resources  :events,    only: [:index,:new, :create, :show]
end
