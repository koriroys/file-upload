Rails.application.routes.draw do
  get 'welcome/index'
  post 'welcome/upload'
  post 'welcome/reset'
  get 'welcome/totals'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
