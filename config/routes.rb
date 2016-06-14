Rails.application.routes.draw do

  resources :social_users
  resources :api_keys
  resources :verifications
  resources :ley_articulos, shallow: true do
    put 'validar_documento', on: :member
    resources :ley_fraccions do
      put 'validar_documento', on: :member
      collection do
        get 'new_import'
        post 'create_import'
        get 'download_import_file'
      end
    end
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :staffs do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :job_titles do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :ascriptions do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :territorial_units do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :social_development_programs
  resources :suppliers
  resources :towns do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :states do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end

  resources :financial_document_types

  resources :projects, shallow: true do
    resources :project_activity_obras, shallow: true do
      resources :financial_documents do
        get 'new_with_type', on: :collection
      end
    end
    resources :project_activity_socials, shallow: true do
      resources :beneficiaries do
        collection do
          get 'new_import'
          post 'create_import'
          get 'download_import_file'
        end
      end
      resources :financial_documents do
        get 'new_with_type', on: :collection
      end
    end
    resources :project_activity_adquisicions, shallow: true do
      resources :financial_documents do
        get 'new_with_type', on: :collection
      end
    end
    resources :project_activity_nominas, shallow: true do
      resources :financial_documents do
        get 'new_with_type', on: :collection
      end
      resources :paysheets do
        collection do
          get 'new_import'
          post 'create_import'
          get 'download_import_file'
        end
      end
    end
  end
  resources :key_analyticals do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_ppr_spending_destinations do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_uni_measure_units do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_are_areas
  resources :cat_ppr_digit_identifiers
  resources :cat_ppr_par_partida_especificas do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_ppr_par_partida_genericas do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_ppr_par_concepts do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_ppr_par_chapters
  resources :cat_ppr_expense_types
  resources :cat_aci_institutional_activities do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_ere_subresults do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_ere_results do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_ere_expending_focus do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_cfu_subfunctions do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_cfu_functions do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_cfu_finalities
  resources :cat_fon_funds
  resources :cat_fon_origin_resources
  resources :cat_fon_year_documents
  resources :cat_fon_specific_sources
  resources :cat_fon_generic_sources
  resources :cat_fon_funding_sources
  resources :cat_pgd_line_of_actions do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_pgd_goals do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_pgd_objectives do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_pgd_area_of_opportunities do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_pgd_axis do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_gen_line_of_actions do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_gen_strategies do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_gen_axis do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_der_line_of_actions do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_der_strategies do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end
  resources :cat_der_human_rights do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end

  resources :comments
  resources :conversations, only: [:index, :show, :destroy] do
    post :mark_as_read, on: :member
    get :mark_all_as_read, on: :collection
  end
  resources :delayed_jobs
  resources :thing_categories
  resources :wizard
  resources :public_activity
  resources :thing_contacts
  resources :thing_parts
  resources :things do
    collection do
      get 'new_import'
      post 'create_import'
      get 'download_import_file'
    end
  end

  namespace :dynamic_select do
    get ':thing_id/thing_contacts', to: 'thing_contacts#index', as: 'thing_contacts' # el as: es para que el helper method sea 'dynamic_select_thing_contacts_path' y no 'dynamic_select_path'
  end

  namespace :dev do
    resources :catalog_cleaners do
      post :run_cleaner, on: :collection
    end
    resources :chucky_bots
    resources :examples do
      collection do
        get 'chartkick'
        get 'cors'
      end

    end
  end

  namespace :admin do
    root to: 'application#index'
    resources :settings
  end

  devise_for :users
  resources :users do
    get 'resend_password_instructions/:id', action: 'resend_password_instructions', on: :collection
    get 'mentionables', on: :collection
  end

  devise_for :api_users, controllers: { registrations: 'api_users/registrations', confirmations: 'api_users/confirmations', passwords: 'api_users/passwords' }
  resources :api_users do
    get 'error_when_confirmation', to: 'api_users/welcome#error_when_confirmation', on: :collection
    get 'check_credentials', to: 'api_users/welcome#check_credentials', on: :collection
  end
  get 'api_user_root', to: 'api_users/welcome#welcome'


  get "application/access_denied"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Rout para probar paginas
  get 'welcome/prueba'

  # You can have the root of your site routed with "root"
  root to: 'welcome#index'

  #match '*unmatched_route', :to => 'application#raise_not_found!', :via => :all

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #
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
  #     #   end


  # API's routes
  api_version(:module => "V1", :path => {:value => "v1"}, :defaults => {:format => "json"}) do
    resources :things
    resources :project_activity_obras
    resources :verifications
    resources :projects, only: :index
  end
end
