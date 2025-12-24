Rails.application.routes.draw do
  get "unsubscribes/show"
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # 將首頁設定為產品列表
  root "products#index"
  # 自動生成 7 個標準 CRUD 路由
  resources :products do
    resources :subscribers , only: [:create]
  end

  resource :unsubscribe, only: [ :show ]
end
