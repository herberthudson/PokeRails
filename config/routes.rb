Rails.application.routes.draw do
  get 'cities/index'
  get 'cities/view'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
