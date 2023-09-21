Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :students do
    resource :cover_image, only: [:destroy], module: :student
   end
  # get "/student/new", to: "student#new", as: :new_student
  # get "/student/:id", to: "student#show", as: :student
  # patch "/student/:id", to: "student#update"
  # delete "/student/:id", to: "student#delete"
  # get "/student/:id/edit", to: "student#edit", as: :edit_student
  # post "/student", to: "student#create", as: :students
  
  # Defines the root path route ("/")
   root "students#index"
end
