Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "root#index"
  get "url/new" => "url#new"
  post "url" => "url#create"
end
