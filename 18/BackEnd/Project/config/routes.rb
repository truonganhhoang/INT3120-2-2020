Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :units
  resources :new_words
  resources :questions do
    collection do
      post :answer
    end
  end
  resources :multiple_choice do
    collection do
      post :answer
    end
  end
end
