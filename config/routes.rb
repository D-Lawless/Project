Rails.application.routes.draw do

  # get 'home/feed'
  root "home#feed"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :events do
    resources :posts, except: [:index] do
      resources :comments, except: [:index]
    end
  end

  resources :profiles
  resources :posts, only: [:new, :show, :create, :index]

  get 'events/feed', :to => 'events#feed'



end