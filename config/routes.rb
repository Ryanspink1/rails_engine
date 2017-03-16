
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "find_merchants#show"
        get "/find_all", to: "find_merchants#index"
        get "/random", to: "random_merchants#show"
      end

      namespace :items do
        get '/find', to: "find_items#show"
        get '/find_all', to: "find_items#index"
        get "/random", to: "random_items#show"
      end

      namespace :invoices do
        get '/find', to: "find_invoices#show"
        get '/find_all', to: "find_invoices#index"
        get "/random", to: "random_invoices#show"
      end

      namespace :invoice_items do
        get '/find', to: "find_invoice_items#show"
        get '/find_all', to: "find_invoice_items#index"
        get "/random", to: "random_invoice_items#show"
      end

      namespace :transactions do
        get "/find", to: "find_transactions#show"
        get "/find_all", to: "find_transactions#index"
        get "/random", to: "random_transactions#show"
      end

      namespace :customers do
        get "/find", to: "find_customers#show"
        get "/find_all", to: "find_customers#index"
        get "/random", to: "random_customers#show"
      end

      resources :merchants, only: [:index, :show] do
        get '/revenue', to: 'merchants/merchants_revenue#show'
        get '/items', to: 'merchants/merchant_item_list#show'
      end

      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :items, only: [:index, :show] do
        get "/best_day", to: "best_day_items#show"
      end
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
