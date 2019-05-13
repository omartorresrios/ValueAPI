class Company < ApplicationRecord
	has_many :departments
	has_many :users
	has_many :values
	has_many :reviews
end
