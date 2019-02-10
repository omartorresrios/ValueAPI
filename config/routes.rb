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
    get ':id/received_reviews' => 'profile#received_reviews'
    get ':id/profile' => 'profile#profile'
    get ':id/sent_reviews' => 'profile#sent_reviews'
    patch ':id/edit' => 'user#update'

  end

end
