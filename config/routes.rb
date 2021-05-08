Rails.application.routes.draw do

  root 'api/v1/projects#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :api do
    namespace :v1 do

      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'

      resources :projects do
        resources :tasks
        get :old_tasks, on: :member
      end
    end
  end
end
