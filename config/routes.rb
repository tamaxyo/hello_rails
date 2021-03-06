Rails.application.routes.draw do
  resources :blogs do
    resources :entries do
      resources :comments, :only => [:create, :destroy] do
        member do
          put :approve
        end
      end
    end
  end

  root 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
