Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "find_merchants#show"
      end

      namespace :items do
        get '/find', to: "find_items#show"
        get '/find_all', to: "find_items#index"
      end

      namespace :invoices do
        get '/find', to: "find_invoices#show"
        get '/find_all', to: "find_invoices#index"
      end

      namespace :invoice_items do
        get '/find', to: "find_invoice_items#show"
        get '/find_all', to: "find_invoice_items#index"
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
