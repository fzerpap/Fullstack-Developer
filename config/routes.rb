Myapp::Application.routes.draw do

  
  root to: 'static#index'
  get 'static/sign_up', to: 'static#sign_up'
  post 'static/create', to: 'static#create'

  get  'paneis/index', to: 'paneis#index', as: :paneis
  get  'paneis/refresh', to: 'paneis#refresh'
  
  resources :file_users, only: [:index, :new, :create]
  get 'file_users/import', to: 'file_users#import'
   
  
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  devise_scope :user do
    get 'users/new', to: 'users/registrations#new_user'
    post 'users/create_user', to: 'users/registrations#create_user'
    get 'user/show/:id', to: 'users/registrations#show', as: :user_show
    get 'users/index', to: 'users/registrations#index'
    get 'users/edit_user/:id', to: 'users/registrations#edit_user', as: :user_edit_user
    post 'users/update_user', to: 'users/registrations#update_user'
    delete 'users/delete_user/:id', to: 'users/registrations#delete_user', as: :user_delete_user
    get 'profile', to: 'users/profiles#profile'
    get 'profile/edit', to: 'users/profiles#edit'
    post 'profile/update', to: 'users/profiles#update'
    delete 'profile/destroy/:id', to: 'users/profiles#destroy'


  end

end


