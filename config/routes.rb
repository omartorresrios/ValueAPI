Rails.application.routes.draw do
  
  scope '/api' do

  	namespace :users do
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
      post 'google/login' => 'google_logins#create'
    end

    post ':id/write_review' => 'review#create'
    get 'all_reviews' => 'home#index'
    get 'all_users' => 'search#index'

  end

end
