class Company < ApplicationRecord
	has_many :department
	has_many :user
	has_many :value
end