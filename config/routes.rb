Rails.application.routes.draw do
  get 'settings' => 'settings#index'

  get 'help' => 'help#index'

  #get 'events/find_nearby_events' => 'events#find_nearby_events'
   # post 'events/create_attend_relation' => 'events#create_attend_relation'
    resources :events do
        collection do
            get :find_nearby_events
            get :similar_events
            post :create_attend_relation
        end
    end
  devise_for :users, controllers: { registrations: 'users/registrations'  }
  resources :users, :only => [:index, :show, :edit, :update]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'events#index'
end
