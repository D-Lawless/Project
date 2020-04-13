Rails.application.routes.draw do

  # get 'home/feed'
  root "home#feed"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :events do
    resources :posts, except: [:show, :index] do
      resources :comments, except: [:show, :index]
    end
  end

  get 'events/feed', :to => 'events#feed'



end