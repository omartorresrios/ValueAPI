Rails.application.routes.draw do
  
  scope '/api' do

  	namespace :users do
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
      post 'google/login' => 'google_logins#create'
    end

  end

end
