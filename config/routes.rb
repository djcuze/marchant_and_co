Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'invoices#index'
  resources 'inventory_items'
  resources 'invoice_items'
  resources 'invoices'
  resources 'categories'
end
