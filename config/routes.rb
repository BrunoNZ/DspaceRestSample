Rails.application.routes.draw do

  namespace :dspace_users do
    get 'show'
    get 'login'
    post 'login_action'
    delete 'logout_action'
  end

  namespace :pages do
    get 'welcome'
    get 'about'
    get 'contact'
  end

  namespace :dspace_reports do
    get 'item_query'
  end

  resources :dspace_communities, path: '/communities'
  resources :dspace_collections, path: '/collections'
  resources :dspace_items, path: '/items'
  resources :dspace_bitstreams, path: '/bitstreams'
  resources :dspace_schemas, path: '/schemas' do
    resources :dspace_metadata_fields, path: '/metadata_fields'
  end
  # You can have the root of your site routed with "root"
  root 'pages#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
