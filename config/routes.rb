Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :levels, :shallow => true do
    resources :subjects do
      resources :questions
  resources :chapters

    end
  resources :exams

  end

  resources :teachers
  resources :students
  resources :requests
 # devise_for :users
devise_for :users, :controllers => { registrations: 'users/registrations' }
  match '/levels/:level_id/assignleveltostudent' => 'levels#assignleveltostudent', :via => [:get, :post], as: :assignleveltostudent
  match'/students/:student_id/mylevels' => 'students#mylevels', via: :get, as: :mylevels
  match'/levels/:level_id/viewstudents' => 'levels#viewstudents', via: :get, as: :viewstudents
  match '/teachers/:teacher_id/assignleveltoteacher' => 'teachers#assignleveltoteacher', :via => [:get, :post], as: :assignleveltoteacher
  match '/teachers/:teacher_id/readmylevel' => 'teachers#readmylevel', via: :get,  as: :readmylevel
  match '/exam/:exam_id/setpaper' => 'exams#setpaper', :via => [:get, :post], as: :setpaper
  match '/exam/:exam_id/setsubject' => 'exams#setsubject', :via => [:get, :post], as: :setsubject
 match '/exam/:exam_id/setting' => 'exams#setting', :via => [:get, :put], as: :setting
 match '/exam/:exam_id/currentpaper' => 'exams#currentpaper', :via => [:get, :put], as: :currentpaper
  match '/exam/exam_id/examinstruction' => 'exams#examinstruction', :via => :get, as: :examinstruction

 match '/exam/:exam_id/giveexam' => 'exams#giveexam', :via => [:get, :post], as: :giveexam
  match '/result_id/result' => 'exams#result', :via => :get, as: :result
  #mount Ckeditor::Engine => '/ckeditor'

  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
