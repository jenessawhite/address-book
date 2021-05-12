Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "contacts#index"
  get "/contacts", to: "contacts#index"
  get "/contacts/:id", to: "contacts#show"
  get "/contacts/new", to: "contacts#new"
  get "/contacts/:id/edit", to: "contacts#edit"
  put "/contacts/:id/update", to: "contacts#update"
end