Rails.application.routes.draw do
  get 'home/index'

  resources :publishers do
    resources :books do
      resources :location_candidates, only: [:index]
    end
    resources :scans, only:[:create,:index,:show] do
      member do
        get 'analyze'
        get 'export'
      end
      resources :audits ,only: [:show] do
        member do
          get 'reset'
        end
      end

    end
    resources :location_candidates, only:[:index]
    resources :platforms, only:[:destroy]

  end

  resources :platform_book do
    resources :location_candidates, only:[:update]
  end

  resources :books
  resources :platforms
  resources :publisher_platforms, only: [:create]
  resources :territories
  
  root "home#index"
  

end
