Rails.application.routes.draw do





  # Business pages
  get 'business' => 'business#index'
  get 'business/pricing'
  get 'business/why_us'
  get 'business/signup'
  post 'business/signup'
  get 'business/login'
  post 'business/login'

  scope '/business' do
    get 'product' => 'product#index'
    get 'product/collect'
    get 'product/invite'
    get 'product/share'
    get 'product/services'

    get 'resources' => 'resources#index'
    get 'resources/experience'
    get 'resources/brochure'
    get 'resources/examples'
    get 'resources/calculate'


    #modules
    get 'dashboard' => 'dashboard#index'

    get 'modules' => 'dashboard#modules'
    get 'modules/emailtemplate' => 'dashboard#email_template'


    get 'reviews' => 'dashboard#reviews'

  end

  # -----------------------------------

  # Review pages
  get 'reviews' => 'review#index'
  get 'reviews/:id' => 'review#show'
  get 'reviews/rate/:slug' => 'review#rate'
  post 'reviews/rate' => 'review#rate'

  # -----------------------------------

  # Footer links
  get 'about' => 'pages#about'
  get 'faq' => 'pages#faq'
  get 'contacts' => 'pages#contacts'
  get 'blog' => 'pages#blog'
  get 'conditions' => 'pages#conditions'
  get 'confidentalpolitic' => 'pages#confidentalpolitic'
  get 'solutionsbusiness' => 'pages#solutionsbusiness'


  # -----------------------------------

  resources :companies
  resources :subcategories

  get 'home/index'
  get 'home/top_categories'

  get 'search' => 'home#search'
  post 'search' => 'home#search'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: "home#index"


  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/signup' => 'devise/registrations#new'
  end

  # resources :users
  resources :root_categories
  resources :company_subcategories,    only: [:create, :destroy]


  get 'categories' => 'home#categorylist'
  get 'categories/:id' => 'home#categoryview'

  get 'users' => 'home#user'
  get 'users/:id' => 'home#user'

  get 'companies/:slug' => 'companies#show'



  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
