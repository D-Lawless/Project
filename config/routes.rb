Rails.application.routes.draw do

  # get 'home/feed'
  root "home#feed"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :events do
    resources :posts, except: [:index] do
      resources :comments, except: [:index]
    end
    resources :event_group
    resources :group_members, only: [:new, :index]
  end

  resources :profiles do
    resources :contacts, only: [:new, :index]

    # resources :connections, only: [:new, :index]
  end

  resources :posts, only: [:new, :show, :create, :index]

  get 'events/feed', :to => 'events#feed'
  get '/upgrade/:id' => 'group_members#upgrade'
  get '/downgrade/:id' => 'group_members#downgrade'

  # get '/events/:id/group/add_user' => 'group_members#add_user'




end