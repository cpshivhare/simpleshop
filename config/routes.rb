Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/sign_in',
               sign_out: 'api/sign_out',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'api/sessions',
               registrations: 'api/registrations'
             }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      scope except: %i[new edit] do
        resources :order_products
        resources :orders
        resources :products, only: :index
        resources :regions do
          resources :products
        end
      end
    end
  end

  root 'homepage#index'
  get '/*path' => 'homepage#index'
end
