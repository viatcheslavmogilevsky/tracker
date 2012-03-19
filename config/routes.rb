Tracker::Application.routes.draw do

  resources :users do
    member do
      get 'no_completed_tasks'
      get 'after_deadline'
    end
    resources :tasks, :except => [:index, :show] do
      member do
        put 'set_complete'
      end
    end
  end
  root :to => "users#index"

end
