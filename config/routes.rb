Rails.application.routes.draw do

  scope '/api' do
  	namespace :users do
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
      post 'google/login' => 'google_logins#create'
      get 'all_companies' => 'registrations#all_companies'
      get ':id/all_departments' => 'registrations#all_departments'
    end

    # Admin
    get ':id/departments_that_most_recognize' => 'admin#departments_that_most_recognize'
    get ':id/departments_most_recognize' => 'admin#departments_most_recognize'
    get ':id/employees_who_most_recognize' => 'admin#employees_who_most_recognize'
    get ':id/employees_most_recognize' => 'admin#employees_most_recognize'
    get ':id/number_of_reviews_by_value' => 'admin#number_of_reviews_by_value'
    get ':id/number_of_reviews' => 'admin#number_of_reviews'
    get ':id/total_employees_who_recognized' => 'admin#total_employees_who_recognized'
    get ':id/total_employees_that_were_recognized' => 'admin#total_employees_that_were_recognized'
    get ':id/total_empl_that_were_recognized_counter' => 'admin#total_empl_that_were_recognized_counter'



    get ':id/company' => 'admin#company'
    get ':id/value_one' => 'review#value_one'



    # Employee
    post ':id/write_review' => 'review#create'
    get 'all_reviews' => 'home#index'
    get ':id/all_values' => 'review#all_values'
    get 'all_users' => 'search#index'
    get ':id/received_reviews' => 'profile#received_reviews'
    get ':id/profile' => 'profile#profile'
    get ':id/sent_reviews' => 'profile#sent_reviews'
    patch ':id/edit' => 'user#update'

  end

end
