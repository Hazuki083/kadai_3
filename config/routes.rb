Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   devise_for :users, controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations'
}
   root to: 'homes#top'
   get "home/about" => "homes#about"
   
   resources :books do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
   end
   
   resources :users do
      resource :relationships, only: [:create, :destroy]
      member do
          get :follows, :followers
        end
   end
end
