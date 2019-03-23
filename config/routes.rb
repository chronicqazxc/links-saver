Rails.application.routes.draw do
  get 'welcome/index'
  get '/json_parser/' => 'json_parser#parse', :as => :parser
  post '/json_parser' => 'json_parser#parse', :as => :parse_json
  get '/catalogs/:catalog_id/modal/links/:id(.:format)' => 'catalogs#modal', as: 'modal_catalogs_link'
  get '/catalogs/:catalog_id/x_frame_options/links/:id(.:format)' => 'catalogs#x_frame_options', as: 'x_frame_options'

  resources :catalogs do
    resources :links
  end

  resources :catalogs do
    collection { post :sort }
  end

  resources :links do
    collection { post :sort }
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
