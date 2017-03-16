
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "find_merchants#show"
        get "/find_all", to: "find_merchants#index"
        get "/random", to: "random_merchants#show"
        get "/most_items", to: "merchants_most_items#index"
        get "/most_revenue", to: "most_revenue#index"
        get "/revenue", to: "revenue_on_date#show"
      end

      namespace :items do
        get "/find", to: "find_items#show"
        get "/find_all", to: "find_items#index"
        get "/random", to: "random_items#show"
        get "/most_items", to: "most_items#index"
        get "/most_revenue", to: "most_revenue#index"
      end

      namespace :invoices do
        get "/find", to: "find_invoices#show"
        get "/find_all", to: "find_invoices#index"
        get "/random", to: "random_invoices#show"
      end

      namespace :invoice_items do
        get "/find", to: "find_invoice_items#show"
        get "/find_all", to: "find_invoice_items#index"
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
        get "/revenue", to: "merchants/merchants_revenue#show"
        get "/items", to: "merchants/merchant_item_list#index"
        get "/invoices", to: "merchants/merchant_invoice_list#index"
        get "/favorite_customer", to: "merchants/favorite_customer#show"
      end

      resources :customers, only: [:index, :show] do
        get "/invoices", to: "customers/customer_invoice_list#index"
        get "/transactions", to: "customers/customer_transaction_list#index"
        get "/favorite_merchant", to: "customers/customers_favorite_merchant#show"
      end

      resources :transactions, only: [:index, :show] do
        get "/invoice", to: "transactions/transaction_invoice#show"
      end

      resources :items, only: [:index, :show] do
        get "/best_day", to: "items/best_day_items#show"
        get "/invoice_items", to: "items/items_invoice_items#index"
        get "/merchant", to: "items/items_merchant#show"
      end

      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoices/invoices_transactions#index"
        get "/invoice_items", to: "invoices/invoices_invoice_items#index"
        get "/items", to: "invoices/invoices_items#index"
        get "/customer", to: "invoices/invoices_customer#show"
        get "/merchant", to: "invoices/invoices_merchant#show"
      end

      resources :invoice_items, only: [:index, :show] do
        get "/item", to: "invoice_items/invoice_items_item#show"
        get "/invoice", to: "invoice_items/invoice_items_invoice#show"
      end
    end
  end
end
